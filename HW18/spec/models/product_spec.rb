# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    let(:category) { create(:category) }
    let(:product) { described_class.new }
    let(:product_2) { create(:product) }

    it 'should return errors' do
      product.valid?
      expect(product.errors[:name]).to eq(['can\'t be blank'])
      expect(product.errors[:price]).to eq(['can\'t be blank', 'is not a number'])
    end

    it 'should have name, description and price' do
      expect(product_2.name).not_to be nil
      expect(product_2.description).not_to be nil
      expect(product_2.price).not_to be nil
    end
  end
end
