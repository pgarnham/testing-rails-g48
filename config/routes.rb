Rails.application.routes.draw do
  resources :administradors
  resources :contenidos
  resources :eventos
  resources :ocupadas
  resources :ofrezcos
  resources :relacion_buscos
  resources :buscos
  resources :group_members
  resources :groups
  resources :courses
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
