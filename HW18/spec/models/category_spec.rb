require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { described_class.new }
  let(:category_2) { create(:category) }

  it 'should return errors' do
    category.valid?
    expect(category.errors[:title]).to eq(['can\'t be blank'])
  end

  it 'should have title' do
    expect(category_2.title).not_to be nil
  end
end
