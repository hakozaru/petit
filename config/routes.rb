Rails.application.routes.draw do
  #root 'posts#index'
  root 'petit#index'

  resources :posts do
    resources :comments
  end

  post 'users/create'
  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'
  post 'signin' => 'session#create'
  get 'signout' => 'sessions#destroy'
end
