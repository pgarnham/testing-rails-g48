Rails.application.routes.draw do
  resources :courses
  resources :events
  resources :rooms
  resources :campus
  devise_for :users
  resources :posts do
    resources :comments
  # resources :posts
  # resources :comments
  end
root 'welcome#index'
end
