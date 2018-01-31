require File.join(File.dirname(__FILE__), '../lib/gilded_rose')

describe GildedRose do

  let(:items)                 { [RegularItem.new("foo", 1, 2)] }
  let(:sulfuras)              { [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)] }

  describe "#update_quality" do

    describe "all items" do

      it "does not change the name" do
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality
        expect(items[0].name).to eq "foo"
      end

      it "does not reduce the quality to below 0" do
        days = 3
        gilded_rose = GildedRose.new(items)
        (1..days).each do |day|
          gilded_rose.update_quality
        end
        expect(items[0].quality).to eq 0
      end
    end

    describe "regular items" do
      it "reduces the quality by 1 for regular items before their sell in date" do
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality
        expect(items[0].quality).to eq 1
      end

      it "reduces the quality by 2 for regular items after their sell in date" do
        items = [RegularItem.new("foo", 0, 2)]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality
        expect(items[0].quality).to eq 0
      end
    end

    describe "upgradable items" do
      it "does not increase the quality above 50" do
        aged_brie = [Item.new("Aged Brie", 1, 49)]
        gilded_rose = GildedRose.new(aged_brie)
        gilded_rose.update_quality
        gilded_rose.update_quality
        expect(aged_brie[0].quality).to eq 50
      end

      describe "brie" do
        it "increases the quality by 1 for brie before its sell in date" do
          aged_brie = [Item.new("Aged Brie", 1, 49)]
          gilded_rose = GildedRose.new(aged_brie)
          gilded_rose.update_quality
          expect(aged_brie[0].quality).to eq 50
        end

        it "increases the quality by 2 for brie after its sell in date" do
          aged_brie = [Item.new("Aged Brie", 0, 1)]
          gilded_rose = GildedRose.new(aged_brie)
          gilded_rose.update_quality
          expect(aged_brie[0].quality).to eq 3
        end
      end

      describe "backstage passes" do
        it "increases the quality by 2 within 10 or fewer days of the sell in date" do
          backstage_passes = [Item.new("Backstage passes", 10, 1)]
          gilded_rose = GildedRose.new(backstage_passes)
          gilded_rose.update_quality
          expect(backstage_passes[0].quality).to eq 3
        end

        it "increases the quality by 3 within 5 or fewer days of the sell in date" do
          backstage_passes = [Item.new("Backstage passes", 5, 1)]
          gilded_rose = GildedRose.new(backstage_passes)
          gilded_rose.update_quality
          expect(backstage_passes[0].quality).to eq 4
        end

        it "reduces the quality to 0 after the sell in date" do
          backstage_passes = [Item.new("Backstage passes", 0, 10)]
          gilded_rose = GildedRose.new(backstage_passes)
          gilded_rose.update_quality
          expect(backstage_passes[0].quality).to eq 0
        end
      end
    end

    describe "Sulfuras" do
      it "does not change the quality" do
        gilded_rose = GildedRose.new(sulfuras)
        gilded_rose.update_quality
        expect(sulfuras[0].quality).to eq 80
      end

      it "does not reduce the sell in date" do
        gilded_rose = GildedRose.new(sulfuras)
        gilded_rose.update_quality
        expect(sulfuras[0].sell_in).to eq 0
      end
    end
  end

  describe "sell in date" do
    describe "regular items" do
      it "reduces the sell in date by 1 regular items" do
        days = 5
        items = [RegularItem.new("foo", 10, 0)]
        gilded_rose = GildedRose.new(items)
        (1..days).each do |day|
          gilded_rose.update_quality
        end
        expect(items[0].sell_in).to eq 5
      end

      it "sell in date can be negative" do
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality
        gilded_rose.update_quality
        expect(items[0].sell_in).to eq -1
      end
    end
  end
end
