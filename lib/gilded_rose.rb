class GildedRose

  MINIMUM_QUALITY = 0
  MAXIMUM_QUALITY = 50
  EXPIRED = 0

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.update_quality
    end
  end
end

###

class Sulfuras
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality
    return
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

###

class RegularItem

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
    if @quality > MINIMUM_QUALITY
      @quality -= 1
    end
    if @sell_in < EXPIRED && @quality > MINIMUM_QUALITY
      @quality -= 1
    end
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

###

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

###

class BackstagePasses

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

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

###

# class Item
#   attr_accessor :name, :sell_in, :quality
#
#   def initialize(name, sell_in, quality)
#     @name = name
#     @sell_in = sell_in
#     @quality = quality
#   end
#
#   def to_s()
#     "#{@name}, #{@sell_in}, #{@quality}"
#   end
# end
