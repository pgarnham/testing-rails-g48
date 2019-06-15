Rails.application.routes.draw do
  resources :perfils
  resources :destacadas
  resources :profesors
  resources :alumnos
  resources :mensajes, :except => [:edit]
  resources :sol_admins
  resources :sol_moderadors
  resources :salita, :only => [:index]
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

  resources :posts do
    member do
      put "like" => "posts#upvote"
      put "unlike" => "posts#downvote"
    end
  end
root 'welcome#index'
end
