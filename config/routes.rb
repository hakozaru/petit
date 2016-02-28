Rails.application.routes.draw do
  #root 'posts#index'
  root 'petit#index'

  resources :users do
    resources :posts do
      resources :comments
    end
  end

  #post 'users/create'
  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'
end
