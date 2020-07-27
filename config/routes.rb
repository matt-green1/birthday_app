Rails.application.routes.draw do
  resources :gifts, except: [:index, :show]
  resources :gift_birthdays, except: [:index, :show]
  resources :reminders, except: [:index, :show, :destroy]
  resources :birthdays
  resources :users

  #add session later

  root 'static#index', page: 'index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
