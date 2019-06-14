Rails.application.routes.draw do
  resources :perfils
  resources :destacadas
  resources :profesors
  resources :alumnos
  resources :mensajes, :except => [:edit] # Hacer esto con las demas cosas
  resources :sol_admins #                   Tambien usar :only (en vez de edit)
  resources :sol_moderadors
  resources :salita
  resources :registrados
  resources :moderadors
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
