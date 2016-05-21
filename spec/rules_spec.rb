require 'spec_helper'
require 'rules'

describe Rules do

  subject(:rules) { Rules.new }

  it 'deducts 10% from total if they spend over 60' do
    basket = [{:name=>"Personalized cufflinks", :price=>45.0}, {:name=>"Personalized cufflinks", :price=>45.0}]
    expect(rules.redeem(90, basket)).to eq 81
  end

  it 'if you buy 2 or more lavender hearts then the price drops to £8.50' do
    basket = [{:name=>"Lavender heart", :price=>9.25}, {:name=>"Lavender heart", :price=>9.25}]
    expect(rules.redeem(18.50, basket)).to eq 17
  end
end
