Rails.application.routes.draw do
  root 'petit#index'

  resources :users, only: [:show, :create] do
    resources :posts do
      resources :comments, only: [:create]
    end
  end

  get '/:username' => 'posts#user_page', as: :userpage

  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'
end
