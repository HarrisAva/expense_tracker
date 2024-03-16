Rails.application.routes.draw do
  get 'categories/index'
  get 'web/bootstrap'
  get 'sessions/create'
  
  post '/login', to:'sessions#create'

  resources :users

  get '/my_expenses', to: 'expenses#my_expenses'

  patch '/expenses/:id', to: 'expenses#update', as: 'expense'
  resources :expenses
  resources :categories


end
