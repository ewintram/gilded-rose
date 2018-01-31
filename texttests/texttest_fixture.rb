#!/usr/bin/ruby -w

require_relative '../lib/gilded_rose'

puts "OMGHAI!"
items = [
  RegularItem.new(name="foo", sell_in=10, quality=20),
  UpgradableItem.new(name="Aged Brie", sell_in=2, quality=0),
  RegularItem.new(name="foo", sell_in=5, quality=7),
  Sulfuras.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
  Sulfuras.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
  BackstagePasses.new(name="Backstage passes", sell_in=15, quality=20),
  BackstagePasses.new(name="Backstage passes", sell_in=10, quality=49),
  BackstagePasses.new(name="Backstage passes", sell_in=5, quality=49),
  Conjured.new(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
]

days = 2
if ARGV.size > 0
  days = ARGV[0].to_i + 1
end

gilded_rose = GildedRose.new items
(0...days).each do |day|
  puts "-------- day #{day} --------"
  puts "name, sellIn, quality"
  items.each do |item|
    puts item
  end
  puts ""
  gilded_rose.update_quality
end
