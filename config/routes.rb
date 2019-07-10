Rails.application.routes.draw do
  namespace :admin do
    resource :cds
  end
  get 'users/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'root#top'
end
