class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    callback_hash = {
      "Aged Brie" => "AgedBrie",
      "Backstage Pass" => "BackstagePass",
      "Conjured" => "Conjured",
      "Sulfuras" => "Sulfuras"
      "Inventory Item" => "InventoryItem"
    }
    @items.each do |item|
      item_name = callback_hash[item.name]
      item_class = Object.const_get(item_name)
      item_class.new(item.name, item.sell_in, item.quality).update_quality(item)
    end
  end

end

