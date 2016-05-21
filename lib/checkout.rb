require_relative 'rules'

class InvalidItem < StandardError; end

class Checkout
  attr_reader :basket
  attr_accessor :total

  PRODUCTS = {  001 => { :name => 'Lavender heart', :price => 9.25 },
                002 => { :name => 'Personalized cufflinks', :price => 45.00 },
                003 => { :name => 'Kids T-shirt', :price => 19.95 }
              }

  def initialize(promotional_rules = Rules.new)
    @promotional_rules = promotional_rules
    @basket = []
    @total = 0
    @products = PRODUCTS
  end

  def scan(code)
    raise InvalidItem, 'Invalid product code' unless @products[code]
    basket << products[code]
  end

  def get_total
    add_up_items
    redeem_discounts
  end

  private

  attr_reader :products, :promotional_rules

  def add_up_items
    basket.each { |item| self.total += item[:price] }
  end

  def redeem_discounts
    self.total = promotional_rules.redeem(self.total, basket)
  end
end
