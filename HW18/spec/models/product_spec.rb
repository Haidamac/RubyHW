# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    let(:product) { described_class.new }

    it 'should return errors' do
      product.valid?
      expect(product.errors[:name]).to eq(['can\'t be blank'])
    end
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
