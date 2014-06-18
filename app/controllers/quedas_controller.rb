# encoding: utf-8

class QuedasController < ApplicationController
  before_action :set_queda, only: [:show, :edit, :update, :destroy]
  before_action :classifica, only: :novaqueda
  skip_before_filter :verify_authenticity_token  

  # GET /quedas
  # GET /quedas.json
  def index
    @quedas = Queda.all
  end

  # GET /quedas/1
  # GET /quedas/1.json
  def show
  end

  # GET /quedas/new
  def new
    @queda = Queda.new
  end

  # GET /quedas/1/edit
  def edit
  end

  # POST /quedas
  # POST /quedas.json
  def create
    if params[:data].present? # Received a drop sample
      @q = Queda.new
      @q.amostra = params[:data]
      @q.tipo_queda = classifier(params[:data])
      @q.tempo_recebimento = Time.now.to_i
      if params[:imei].present?
        @q.imei = params[:imei]
      end
      if params[:timestamp_queda].present?
        @q.tempo_queda = params[:tempo_queda]
      end
      if params[:email].present?
        @q.email = params[:email]
      end
      if params[:locationX].present?
        @q.locationX = params[:locationX]
      end
      if params[:locationY].present?
        @q.locationY = params[:locationY]
      end
      if @q.save
        head :created
      else
        head :bad_request
      end
    else
      @queda = Queda.new(queda_params)

      respond_to do |format|
        if @queda.save
          format.html { redirect_to @queda, notice: 'Queda was successfully created.' }
          format.json { render action: 'show', status: :created, location: @queda }
        else
          format.html { render action: 'new' }
          format.json { render json: @queda.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def novaqueda
    if params[:data].present?
      @q = Queda.new
      @q.amostra = params[:data]
      @output = @result
      if @q.save
        head :created
      else
        head :bad_request
      end
    end
  end

  # PATCH/PUT /quedas/1
  # PATCH/PUT /quedas/1.json
  def update
    respond_to do |format|
      if @queda.update(queda_params)
        format.html { redirect_to @queda, notice: 'Queda was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @queda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quedas/1
  # DELETE /quedas/1.json
  def destroy
    @queda.destroy
    respond_to do |format|
      format.html { redirect_to quedas_url }
      format.json { head :no_content }
    end
  end



  def classifier(dados)
    # Thresholds  
    toleranceTimeDropButNotFreeFall = 1092
    valueFromFallToPeakThreshold = 9.069249
    minimumValueLimitBetweenCellStill = 8.367404
    maximumValueLimitBetweenCellStill = 10.270218
    variantValueFromLastValue = 0.07649212
    timeBeingStill = 25
    timeSinceHitFloor = 95
    valueFromPeakToGapThreshold = 4.3952117
    valuefromGapToStop = 5.5502796
    timeFromGapToStop = 129
  
    # Data received (samples)
    stringData = dados.split(";")
  
    # Initialize array of data with floats
    data = Array.new
    stringData.each do | sd |
      data << sd.to_f
    end
  
    # Status variables 
    lastValue = 0
    still = 0
    
    hitTheFloor = 0
    startGap = 0
    startDrop = 0
  
    status = data[0] > 2 ? :no_event : :falling
  
    # Main loop
    data.each_with_index do |data, i|
      sum = data
  
      if status != :no_event # An event is happening
        if startDrop != 0 && (i * 5) - startDrop > toleranceTimeDropButNotFreeFall # Started drop, however a "free fall" status didn't happen
          status = :no_event       
        elsif status == :falling && sum > valueFromFallToPeakThreshold # Sum > 3, therefore after free falling it hit a surface, starts the "peak" step
          status = :peak
          hitTheFloor = (i * 5) # Moment when device hit the floor
        elsif status == :peak
          if sum > minimumValueLimitBetweenCellStill && sum < maximumValueLimitBetweenCellStill && (sum - lastValue).abs < variantValueFromLastValue # Value is between 9 and 10.5 and not changing (getting still)
            if still != 0
              if (i * 5) - still > timeBeingStill # It is still for more than 100 milliseconds
                return :carpet # CARPET 
              end
            else 
              still = i * 5 # It wasn't still, but is now, so it starts counting 
            end
          elsif sum < valueFromPeakToGapThreshold && (i * 5) - hitTheFloor < timeSinceHitFloor # Started peek less than 130 milliseconds before 
            status = :gap
            startGap = i * 5
          else
            still = 0 # It is not stills
          end   
        elsif status == :gap # It is in the gap
          if sum > valuefromGapToStop # If value rose more than threshold, verifies if it's stopped
            if (i * 5) - startGap > timeFromGapToStop # If start of gap was more than 20 ms ago
              status = :stopping
            else # If sum is > 5 but start of the gap was less than (x) ms ago, drop of the sum was too quickly, it may be just noise
              status = :peak
            end
          # else # Sum is less than 5
          end
        elsif status == :stopping
          if sum > minimumValueLimitBetweenCellStill && sum < maximumValueLimitBetweenCellStill && (sum - lastValue).abs < variantValueFromLastValue
            if still != 0
              if (i * 5) - still > timeBeingStill
                return :pillow
              end
            else
              still = i * 5
            end
          else
            still = 0
          end
        end
        lastValue = sum
      else # status == :no_event
        if sum < 1
          status = :falling
          startDrop = i * 5
        end
      end
    end
  
    :pillow
  
  end 



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_queda
      @queda = Queda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def queda_params
      params.require(:queda).permit(:imei, :classificacao, :timestamp_queda, :timestamp_recebimento, :amostra)
    end

  def classifica
    s = params[:data]
    @result = "classificado: " + s
  end
end
