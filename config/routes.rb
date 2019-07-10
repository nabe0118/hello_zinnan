Rails.application.routes.draw do


  #get 'users/:id' => 'users#show'

  namespace :admin do
    resource :cds
  end
  
  devise_for :users
    resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'root#top'
end
