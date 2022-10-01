Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", omniauth_callbacks: "callbacks"}
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :challenges, only: %i[show index new create destroy edit update] do
    resources :offers, only: %i[create update]
    resources :chatrooms, only: :show do
      resources :comments, only: :create
    end
  end
  resources :users, only: [:index, :show, :edit, :update], path: "index" do
  end
  resources :offers, only: %i[destroy]
  # resources :comments, only: %i[edit update destroy]
  get '/my_challenges', action: :index, controller: 'challenges'
  get '/my_offers', action: :index, controller: 'offers'

end
