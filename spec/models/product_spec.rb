require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validate that it:' do
    # validation tests/examples here
   it 'is a new instance of Product' do 
    @product = Product.new
    expect(@product).to be_a Product
   end

   it 'has a valid name' do 
    @category = Catgeory.new
    @product = Product.new
    expect(@product.name).to_not be_nil
   end

   it 'has a valid price' do 
    # @product = Product.new
    # expect(@product.price).to_not be_nil
   end

   it 'has a valid quantity' do
    # @product = Product.new
    # expect(@product.quantity).to_not be_nil
   end

   it 'has a valid parent category' do
    # @product = Product.new
    # expect(@product.catgeory).to_not be_nil
   end

  end
end