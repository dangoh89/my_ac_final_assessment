Rails.application.routes.draw do
  devise_for :users
  resources :notes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#user_dashboard"
  post 'like', to: 'notes#like'
  post 'unlike', to: 'notes#unlike'
end
