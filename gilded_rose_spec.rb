require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("Aged Brei", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Aged Brei"
    end

    it "increase quality by 1" do
      items = [Item.new("Aged Brei", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 11
    end

    it "decrease sell in by 1" do
      items = [Item.new("Aged Brei", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
    end

    it "increase quality by 2 when sell in < 11" do
      items = [Item.new("Backstage Pass", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 12
    end

    it "increase quality by 3 when sell in < 6" do
      items = [Item.new("Backstage Pass", 4, 12)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 15
    end

    it "drop quality to 0 after concert passes" do
      items = [Item.new("Backstage Pass", 0, 12)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "should not update quality" do
      items = [Item.new("Sulfuras", 4, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 80
    end

    it "should have quality equal to 80" do
      items = [Item.new("Sulfuras", 4, 79)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 79
    end

    it "quality can never be negative" do
      items = [Item.new("Aged Brei", 4, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "quality can never be more than 50" do
      items = [Item.new("Backstage Pass", 4, 49)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to be <= 50
    end

    it "quality degrades twice as fast as normal items" do
      items = [Item.new("Conjured", 4, 49)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 47
    end
  end

end