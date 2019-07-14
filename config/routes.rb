Rails.application.routes.draw do


  #get 'users/:id' => 'users#show'

  namespace :admin do
    resources :cds
    resources :labels, only:[:new, :create]
    resources :artists, only:[:new, :create]
    resources :disks, only:[:new, :create]
  end

  devise_for :users
    resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'root#top'
end
