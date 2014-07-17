module QuedasHelper
	def classifying (data)
		"risk"
	end


	def classifier(dados)

	puts "entered method"

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
end
