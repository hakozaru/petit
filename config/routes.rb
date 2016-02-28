Rails.application.routes.draw do
  #root 'posts#index'
  root 'petit#index'

  resources :posts do
    resources :comments
  end

  resources :users

  #post 'users/create'
  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'
end
