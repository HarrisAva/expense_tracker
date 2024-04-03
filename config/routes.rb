Rails.application.routes.draw do
 
  get 'web/bootstrap'
  get 'sessions/create'
  
  post '/login', to:'sessions#create'

  resources :users

  get '/my_expenses', to: 'expenses#my_expenses'
  get '/expenses_by_category', to: 'expenses#expenses_by_category'
  get '/expenses_by_category_and_month', to: 'expenses#expenses_by_category_and_month'
  get '/total_amount', to: 'expenses#total_amount'
 
  # get '/my_monthly_summary', to: 'expenses#my_monthly_summary'

  patch '/expenses/:id', to: 'expenses#update', as: 'expense'
  resources :expenses
  resources :categories


end
