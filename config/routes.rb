Rails.application.routes.draw do
  resources :bills
  resources :members
  root :to => 'members#index'


  get '/search/:term', to: 'members#search'
  get '/search/bills/:id', to: 'bills#search'
end
