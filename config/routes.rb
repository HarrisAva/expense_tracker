Rails.application.routes.draw do
  get 'categories/index'
  get 'web/bootstrap'
  get 'sessions/create'
  
  post '/login', to:'sessions#create'

  resources :users
  resources :expenses
  resources :categories

  get '/my_expenses', to: 'expenses#my_expenses'

end
