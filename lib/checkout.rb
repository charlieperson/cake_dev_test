class Checkout
  attr_reader :basket, :products

  def initialize
    @basket = []
    @products = { 001 => { :name => 'Lavender heart', :price => 9.25 },
                  002 => { :name => 'Personalized cufflinks', :price => 45.00 },
                  003 => { :name => 'Kids T-shirt', :price => 19.95 }
                }
  end

  def scan(code)
    basket << products[code]
  end
end
