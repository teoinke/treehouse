class QuedasController < ApplicationController
  before_action :set_queda, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token  

  # GET /quedas
  # GET /quedas.json
  def index
    @quedas = Queda.all
  end

  # GET /quedas/1
  # GET /quedas/1.json
  def show
    logger.info "This is from logger in controller"
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
    if params[:data].present?
      @q = Queda.new
      @q.amostra = params[:data]
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_queda
      @queda = Queda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def queda_params
      params.require(:queda).permit(:imei, :classificacao, :timestamp_queda, :timestamp_recebimento, :amostra)
    end
end
