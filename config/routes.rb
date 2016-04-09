Rails.application.routes.draw do
  root 'petit#index'

  resources :users, only: [:show, :create] do
    resources :posts do
      resources :comments, only: [:create]
    end
  end

  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'

  get '/:username' => 'posts#user_page', as: :userpage

end
