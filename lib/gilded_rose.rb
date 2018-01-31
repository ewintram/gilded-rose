class GildedRose

  MINIMUM_QUALITY = 0
  MAXIMUM_QUALITY = 50
  EXPIRED = 0

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
        when "Sulfuras, Hand of Ragnaros"
          return
        when "foo"
          item.update_quality
        when "Aged Brie"
          brie(item)
        when "Backstage passes"
          backstage_passes(item)
      end
    end
  end

  def brie(item)
    reduce_sell_in_by_1(item)
    if item.quality < MAXIMUM_QUALITY
      increase_quality_by_1(item)
    end
    if item.sell_in < EXPIRED && item.quality < MAXIMUM_QUALITY
      increase_quality_by_1(item)
    end
  end

  def backstage_passes(item)
    reduce_sell_in_by_1(item)
    if item.sell_in < EXPIRED
      item.quality = MINIMUM_QUALITY
    else
      if item.quality < MAXIMUM_QUALITY
        increase_quality_by_1(item)
      end
      if item.sell_in < 11 && item.quality < MAXIMUM_QUALITY
        increase_quality_by_1(item)
      end
      if item.sell_in < 6 && item.quality < MAXIMUM_QUALITY
        increase_quality_by_1(item)
      end
    end
  end

  def reduce_sell_in_by_1(item)
    item.sell_in -= 1
  end

  def reduce_quality_by_1(item)
    item.quality -= 1
  end

  def increase_quality_by_1(item)
    item.quality += 1
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
end

###

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
