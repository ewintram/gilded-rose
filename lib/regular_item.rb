require_relative 'item'

class RegularItem < Item

  def update_quality
    reduce_sell_in_by_1
    if quality_above_min?
      reduce_quality_by_1
    end
    if expired? && quality_above_min?
      reduce_quality_by_1
    end
  end
end
