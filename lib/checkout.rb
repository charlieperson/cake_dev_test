class Checkout
  attr_reader :basket, :products

  def initialize
    @basket = []
    @total = 0
    @products = { 001 => { :name => 'Lavender heart', :price => 9.25 },
                  002 => { :name => 'Personalized cufflinks', :price => 45.00 },
                  003 => { :name => 'Kids T-shirt', :price => 19.95 }
                }
  end

  def scan(code)
    basket << products[code]
  end

  def total
    basket.each { |item| @total += item[:price] }
    over_sixty?
    two_hearts?
    return @total
  end

  private
  attr_reader :products

  def over_sixty?
    @total > 60 ? @total = @total * 0.9 : @total
  end

  def two_hearts?
    hearts = 0
    basket.each do |item|
      item[:name] == 'Lavender heart' ? hearts += 1 : hearts += 0
    end
    hearts > 1 ? @total -= (hearts * 0.75) : @total
  end
end
