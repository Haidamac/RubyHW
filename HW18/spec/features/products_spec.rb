# frozen_string_literal: true

require 'rails_helper'

feature 'products' do
  let(:product) { create(:product) }

  context 'as visitor' do
    before do
      visit products_path
    end

    scenario 'viewing index page' do
      expect(page).to have_content('Dionysus Store')
    end

    scenario 'open product show page' do
      visit products_path(product)
      expect(page).to have_current_path(products_path(product))
      expect(page).to have_content('Price:')
    end

    scenario 'sign up' do
      click_link 'Sign Up'
      expect(page).to have_current_path(new_user_registration_path)
      fill_in 'Email', with: 'new_user@bla.net'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully')
    end

    scenario 'adding product' do
      click_button 'Add'
      expect(page).to have_content('In')
    end
  end
end