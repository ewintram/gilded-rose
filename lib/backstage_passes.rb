require_relative 'item'

class BackstagePasses < Item

  def update_quality
    @sell_in -= 1
    if @sell_in < EXPIRED
      @quality = MINIMUM_QUALITY
    else
      if @quality < MAXIMUM_QUALITY
        @quality += 1
      end
      if @sell_in < 10 && @quality < MAXIMUM_QUALITY
        @quality += 1
      end
      if @sell_in < 5 && @quality < MAXIMUM_QUALITY
        @quality += 1
      end
    end
  end
end
