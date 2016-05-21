require 'spec_helper'
require 'checkout'

describe Checkout do

  let(:promotional_rules) { double(:promotional_rules) }
  subject(:checkout) { Checkout.new(promotional_rules) }

  it 'can add items to a basket' do
    checkout.scan(001)
    expect(checkout.basket).to eq [{:name=>"Lavender heart", :price=>9.25}]
  end

  it 'raises error if item is invalid' do
    expect{checkout.scan(004)}.to raise_error(InvalidItem)
  end

  it 'can add up the total of a basket' do
    allow(promotional_rules).to receive(:redeem).and_return(54.25)
    checkout.scan(001)
    checkout.scan(002)
    expect(checkout.get_total).to eq 54.25
  end
end
