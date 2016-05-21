class Rules

  def redeem(total, basket)
    @total = total
    over_sixty?
    two_hearts?(basket)
  end

  private

  def over_sixty?
    @total > 60 ? @total = @total * 0.9 : @total
  end

  def two_hearts?(basket)
    hearts = 0
    basket.each do |item|
      item[:name] == 'Lavender heart' ? hearts += 1 : hearts += 0
    end
    hearts > 1 ? @total -= (hearts * 0.75) : @total
  end
end
