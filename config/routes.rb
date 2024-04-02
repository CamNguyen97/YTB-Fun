Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  root 'pages#home'
  resources :shares, only: [:index, :create]
end
