Rails.application.routes.draw do
  get 'bookings/index'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :flats, only: %i[index new create]
  resources :bookings, only: %i[index show create]
end
