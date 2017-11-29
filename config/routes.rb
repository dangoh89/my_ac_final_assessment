Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :notes do
    resources :likes
  end  
  resources :friendships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#user_dashboard"
  get 'user_notes', to: "notes#user_notes"
  post 'add_follower', to: 'users#add_follower'
end
