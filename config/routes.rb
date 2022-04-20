Rails.application.routes.draw do

  
  resources :categories
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  delete 'logout', to: 'sessions#destroy'
  get 'myusers/unenroll'
  resources :myusers
  resources :events do
    resources :comments do
      member do
        post :like
      end
    end
  end
  
  resources :likes
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'rproducts#index'
  resources :rproducts do
    resources :rorders
  end

  namespace :business do
    get 'search', to:"rcustomers#search"
    resources :rcustomers, only: [:index, :edit, :create] do
      get 'preview', on: :member
      delete 'delete_customer', on: :member
      get 'new', on: :collection, as: 'new'
      patch 'update', on: :member
    end
  end

  
  post '/increaseOrder', to: "employees#increaseOrder"
  post '/decreaseOrder', to: "employees#decreaseOrder"
  get '/users',to:"users#index"
  get 'employees/queries'
  get 'orders/root'
  get 'myproducts/defaultscopeview'
  resources :products
  resources :myproducts
  resources :authors
  resources :orders
  resources :customers
  resources :books
  resources :students
  resources :faculties
  resources :employees

  
 
  #root 'students#index'

end
