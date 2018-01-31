require_relative 'item'

class UpgradableItem < Item

  def update_quality
    @sell_in -= 1
    if @quality < MAXIMUM_QUALITY
      @quality += 1
    end
    if @sell_in < EXPIRED && @quality < MAXIMUM_QUALITY
      @quality += 1
    end
  end
end
