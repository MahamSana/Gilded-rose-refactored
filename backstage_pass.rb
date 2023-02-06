require_relative 'item'

class BackstagePass < Item
  def update_quality(item)
    return if item.quality <= 0
    if item.sell_in < 11 && item.sell_in > 5
      item.quality += 2
    elsif item.sell_in < 6 && item.sell_in > 0
      item.quality += 3
    elsif item.sell_in <= 0
      item.quality = 0
    end
    item.quality = 50 if item.quality > 50
    item.sell_in -= 1
  end
end