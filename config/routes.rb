Rails.application.routes.draw do

  root "students#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"

  resources :ducks, except: [:delete]
  resources :students, except: [:delete]
  resources :users, only: [:new, :create]

  get '*path' => redirect('/')
end
