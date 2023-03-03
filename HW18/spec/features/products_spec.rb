# frozen_string_literal: true

require 'rails_helper'

feature 'products' do
  let(:product) { create(:product) }

  context 'as visitor' do
    scenario 'viewing index page' do
      visit products_path
      expect(page).to have_content('Dionysus Store')
    end

    scenario 'adding product' do
      visit products_path
      click_button 'Add'
      expect(page).to have_content('In')
    end

    scenario 'open product show page' do
      visit products_path(product)
      expect(page).to have_current_path(products_path(product))
      expect(page).to have_content('Price:')
    end
  end
end