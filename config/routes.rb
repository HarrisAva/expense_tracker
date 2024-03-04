Rails.application.routes.draw do
  get 'web/bootstrap'
  get 'sessions/create'
  
  post '/login', to:'sessions#create'

  resources :users
  resources :expenses

end
