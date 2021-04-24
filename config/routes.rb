Rails.application.routes.draw do
  devise_for :users

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :candidates do
    post :vote, on: :member
  end
  root to: 'pages#home'
  resources :pages do
  	get :home, on: :collection
  end

  resources :voters do
  	get :authorize, on: :collection
    get :login, on: :collection
  end

  resource :setting
  resources :vote_records

  get '/results', to: "pages#result"


end
