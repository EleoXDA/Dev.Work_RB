Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :challenges, only: %i[show index new create destroy] do # Add new create destroy
    # resources :reviews, only: %i[new create]
    resources :bookings, only: %i[create update] do # Add update
      member do
        get :review
      end
    end
  end
  resources :bookings, only: %i[destroy]
  # resources :reviews, only: %i[edit update destroy]
  get '/owner_challenges', action: :index, controller: 'challenges'
end
