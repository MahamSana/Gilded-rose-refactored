require_relative 'item'

class InventoryItem < Item

attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

   def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def update_quality(item)
    return if item.quality >= 50 || item.quality <= 0
    if item.sell_in > 0
      item.quality += 1
    end
    item.sell_in -= 1
  end
end