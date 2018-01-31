class Item

  MAXIMUM_QUALITY = 50
  MINIMUM_QUALITY = 0
  EXPIRED = 0

  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def reduce_sell_in_by_1
    @sell_in -= 1
  end

  def quality_above_min?
    @quality > MINIMUM_QUALITY
  end

  def quality_below_max?
    @quality < MAXIMUM_QUALITY
  end

  def expired?
    @sell_in < EXPIRED
  end

  def reduce_quality_by_1
    @quality -= 1
  end

  def reduce_quality_by_2
    @quality -= 2
  end

  def icrease_quality_by_1
    @quality += 1
  end
end
