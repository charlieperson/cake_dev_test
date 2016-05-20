require 'spec_helper'
require 'checkout'

describe Checkout do

  subject(:checkout) { Checkout.new }

  it 'can add items to a basket' do
    checkout.scan(001)
    expect(checkout.basket).to eq [{:name=>"Lavender heart", :price=>9.25}]
  end

  it 'can add up the total of a basket' do
    checkout.scan(001)
    checkout.scan(002)
    expect(checkout.total).to eq 54.25
  end
end
