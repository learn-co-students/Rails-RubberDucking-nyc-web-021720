Rails.application.routes.draw do
  resources :ducks, except: [:delete]
  resources :students, except: [:delete]
end
