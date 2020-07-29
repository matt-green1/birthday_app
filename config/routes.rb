Rails.application.routes.draw do
  resources :gifts, except: [:index, :show]
  resources :reminders
  resources :birthdays
  resources :users


  #add session later
  get '/sessions/new', to: 'sessions#new', as: 'new_session'
  post '/sessions', to: 'sessions#login', as: 'login'
  get '/sessions/logout', to: 'sessions#logout', as: 'logout'

  root 'static#index', page: 'index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
