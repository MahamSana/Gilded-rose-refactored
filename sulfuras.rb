require_relative 'item'

class Sulfuras < Item
  def update_quality(item)
     item.quality = 80
  end
end