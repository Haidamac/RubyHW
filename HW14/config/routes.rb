# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
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

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'products#index'
  get '/current_order', to: 'orders#show_current', as: :current_order
  resources :orders, only: %i[index show]
  resources :line_items, only: %i[create update destroy]
  get 'orders/:id/pay_details' => 'orders#pay_details', as: 'order_pay_details'
  put 'orders/:id/pay' => 'orders#pay', as: 'order_pay'
  get 'orders/:id/paid' => 'orders#paid', as: 'order_paid'
end
