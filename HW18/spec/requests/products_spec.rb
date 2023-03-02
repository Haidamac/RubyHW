# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :request do
  describe 'GET /products' do
    it 'it returns status 200' do
      get products_path
      expect(response).to have_http_status(200)
    end
  end
end
