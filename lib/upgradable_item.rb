class UpgradableItem

  MINIMUM_QUALITY = 0
  MAXIMUM_QUALITY = 50
  EXPIRED = 0

  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality
    @sell_in -= 1
    if @quality < MAXIMUM_QUALITY
      @quality += 1
    end
    if @sell_in < EXPIRED && @quality < MAXIMUM_QUALITY
      @quality += 1
    end
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
