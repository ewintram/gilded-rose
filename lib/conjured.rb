require_relative 'item'

class Conjured < Item

  def update_quality
    reduce_sell_in_by_1
    if quality_above_min?
      reduce_quality_by_2
    end
    if expired? && quality_above_min?
      reduce_quality_by_2
    end
  end
end
