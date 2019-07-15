Rails.application.routes.draw do
  #get 'users/:id' => 'users#show


  namespace :administrator do
    resources :admin_mypages, only:[:index]
    resource :cds
    resources :addresses
    resources :cds
    resources :labels, only:[:new, :create]
    resources :artists, only:[:new, :create]
    resources :disks, only:[:new, :create]

  end

  devise_for :admins,controllers: {
      sessions: 'devise/admins/sessions',
      registrations: 'devise/admins/registrations',
      passwords: 'devise/admins/passwords'
    }

    scope module: 'devise' do
    devise_for :users, controllers: {
      sessions: 'devise/users/sessions',
      registrations: 'devise/users/registrations',
      passwords: 'devise/users/passwords'
    }
  end

    resources :users
    resources :addresses
    resources :cart_items, only:[:index, :show, :edit, :update, :destroy]
    get 'cart_items/:cd_id/new' => 'cart_items#new', as: 'new_cart_item'
    post 'cart_items/:cd_id/create' => 'cart_items#create', as: 'create_cart_items'
    resources :cds, only:[:index]
    root 'cds#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
