Rails.application.routes.draw do
  resources :auxiliars
  resources :chats
  resources :ruidos
  resources :disponibilidads
  resources :enchuves
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


  resources :disponibilidads do
    member do
      put "like" => "disponibilidads#upvote"
      put "unlike" => "disponibilidads#downvote"
    end
  end

  resources :enchuves do
    member do
      put "like" => "enchuves#upvote"
      put "unlike" => "enchuves#downvote"
    end
  end

  resources :ruidos do
    member do
      put "like" => "ruidos#upvote"
      put "unlike" => "ruidos#downvote"
    end
  end
root 'welcome#index'
end
