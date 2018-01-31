require_relative 'item'

class BackstagePasses < Item

  def update_quality
    reduce_sell_in_by_1
    if expired?
      @quality = MINIMUM_QUALITY
    else
      if quality_below_max?
        icrease_quality_by_1
      end
      if @sell_in < 10 && quality_below_max?
        icrease_quality_by_1
      end
      if @sell_in < 5 && quality_below_max?
        icrease_quality_by_1
      end
    end
  end
end
