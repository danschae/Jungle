require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'is it validated?'do
    it 'saves' do
      @category = Category.new(name:"Accessory")
      @product = Product.new(name: "Needle", price: 300, quantity: 5, category: @category)
      @product.save
        expect(Product.count).to eq(1)
    end
    it 'wont work if name is nill' do
      @category = Category.new(name:"Accessory")
      @product = Product.new(name: nil, price: 300, quantity: 5, category: @category)
      @product.save
        expect(Product.count).to eq(0)
    end
    it 'should not work if price is nill' do
      @category = Category.new(name:"Accessory")
      @product = Product.new(name: "Needle", price: nil, quantity: 5, category: @category)
      @product.save
        expect(Product.count).to eq(0)
    end
    it 'should not work if quantity is nil' do
      @category = Category.new(name:"Accessory")
      @product = Product.new(name: "Needle", price: 300, quantity: nil, category: @category)
      @product.save
        expect(Product.count).to eq(0)
    end
    it 'should not work if category is nil' do
      @category = Category.new(name:"Accessory")
      @product = Product.new(name: "Needle", price: 300, quantity: nil, category: nil)
      @product.save
        expect(Product.count).to eq(0)
    end
  end
end
