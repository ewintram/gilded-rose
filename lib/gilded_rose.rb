class GildedRose

  MINIMUM_QUALITY = 0
  MAXIMUM_QUALITY = 50
  SELL_IN_DAYS = 0

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == "Sulfuras, Hand of Ragnaros"
        return
      else
        if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
          if item.quality > MINIMUM_QUALITY
              reduce_quality_by_1(item)
          end
        else
          if item.quality < MAXIMUM_QUALITY
            increase_quality_by_1(item)
            if item.name == "Backstage passes to a TAFKAL80ETC concert"
              if item.sell_in < 11
                if item.quality < MAXIMUM_QUALITY
                  increase_quality_by_1(item)
                end
              end
              if item.sell_in < 6
                if item.quality < MAXIMUM_QUALITY
                  increase_quality_by_1(item)
                end
              end
            end
          end
        end

      sell_in(item)

      if item.sell_in < SELL_IN_DAYS
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > MINIMUM_QUALITY
                reduce_quality_by_1(item)
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < MAXIMUM_QUALITY
            increase_quality_by_1(item)
          end
        end
      end
    end
  end
  end

  def sell_in(item)
    item.sell_in -= 1
  end

  def reduce_quality_by_1(item)
    item.quality -= 1
  end

  def increase_quality_by_1(item)
    item.quality += 1
  end
end

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
