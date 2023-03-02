# frozen_string_literal: true

require 'rails_helper'

feature 'products' do
  let(:product) { create(:product) }

  context 'as visitor' do
    scenario 'viewing index page' do
      visit products_path
      expect(page).to have_content('Dionysus Store')
    end
  end
end