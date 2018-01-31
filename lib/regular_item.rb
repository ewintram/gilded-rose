require_relative 'item'

class RegularItem < Item

  def update_quality
    @sell_in -= 1
    if @quality > MINIMUM_QUALITY
      @quality -= 1
    end
    if @sell_in < EXPIRED && @quality > MINIMUM_QUALITY
      @quality -= 1
    end
  end
end
