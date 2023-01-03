Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :products
  resources :categories

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'products#index'
  get '/cart', to: 'carts#show', as: :cart
  # resources :line_items, only: :create
  resources :orders, only: %i[show create]
  post 'line_items' => 'line_items#create'
  get 'line_items/:id' => 'line_items#destroy', as: 'line_item'
  get 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  get 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'
  get 'orders/:id/pay_details' => 'orders#pay_details', as: 'order_pay_details'
  post 'orders/:id/' => 'orders#pay', as: 'order_pay'
  get 'orders/:id/paid' => 'orders#paid', as: 'order_paid'
  get 'orders' => 'orders#index'
end
