Rails.application.routes.draw do
  resources :members
  root :to => 'members#index'


  get '/search/:term', to: 'members#search'
end
