# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'products#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  authenticate :admin_user do
    mount Sidekiq::Web => '/admin/sidekiq'
  end

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :products
  resources :categories

  resources :orders, only: %i[index show]
  get '/current_order', to: 'orders#show_current', as: :current_order
  get 'orders/:id/pay_details' => 'orders#pay_details', as: 'order_pay_details'
  put 'orders/:id/pay' => 'orders#pay', as: 'order_pay'
  get 'orders/:id/paid' => 'orders#paid', as: 'order_paid'

  resources :line_items, only: %i[show create update destroy]
  put 'line_items/:id/update_order' => 'line_items#update_order', as: 'line_item_order'
end
