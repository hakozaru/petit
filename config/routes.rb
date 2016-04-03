Rails.application.routes.draw do
  root 'petit#index'

  resources :users, only: [:show, :create] do
    get 'page' => 'posts#user_page'
    resources :posts do
      resources :comments, only: [:create]
    end
  end

  #get 'signup' => 'users#new'
  #get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'
end
