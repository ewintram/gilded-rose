require_relative 'backstage_passes'
require_relative 'regular_item'
require_relative 'sulfuras'
require_relative 'upgradable_item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.update_quality
    end
  end
end
