require_relative 'item'

class AgedBrie < Item
  def update_quality(item)
    return if item.quality >= 50 || item.quality <= 0
    if item.sell_in > 0
      item.quality += 1
    end
    item.sell_in -= 1
  end
end