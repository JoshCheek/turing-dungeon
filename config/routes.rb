Rails.application.routes.draw do
  resources :users
  resources :cohorts
  resources :sessions, :only => [:create]
  get '/auth/:provider/callback' => 'sessions#create'
end
