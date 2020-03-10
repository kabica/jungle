require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validate Product' do
    it "is generated with valid attributes" do
      @category = Category.create(name: "test")
      @product = Product.create(name: "test", category: @category, quantity: 1, price: 200 )
      expect(@product).to be_valid
    end
    it "is invalid without name" do
      @category = Category.create(name: "test")
      @product = Product.create(name: nil, category: @category, quantity: 1, price: 200 )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank") 
    end
    it "is invalid without price" do
      @category = Category.create(name: "test")
      @product = Product.create(name: "test", category: @category, quantity: 1, price: nil )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank") 
    end
    it "is invalid without quantity" do
      @category = Category.create(name: "test")
      @product = Product.create(name: "test", category: @category, quantity: nil, price: 200 )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank") 
    end
    it "is invalid without category" do
      @product = Product.create(name: "test", category: nil, quantity: 1, price: 200 )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank") 
    end
  end
end