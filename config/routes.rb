Rails.application.routes.draw do
  resources :bills
  resources :members
  root :to => 'members#index'


  get '/search/:term', to: 'members#search'
  get '/search/bills/member/:id', to: 'bills#search_by_member'
  get '/search/bills/:query', to: 'bills#search_by_query'
end
