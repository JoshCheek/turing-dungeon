Rails.application.routes.draw do
  resources :users
  resources :cohorts
  get '/auth/:provider/callback' => 'sessions#create'
end
