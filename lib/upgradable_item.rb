require_relative 'item'

class UpgradableItem < Item

  def update_quality
    reduce_sell_in_by_1
    if quality_below_max?
      icrease_quality_by_1
    end
    if expired? && quality_below_max?
      icrease_quality_by_1
    end
  end
end
