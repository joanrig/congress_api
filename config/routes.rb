Rails.application.routes.draw do
  resources :bills
  resources :members, only: [:index, :show]
  root :to => 'members#index'



  match '/search/bills/member/:id', to: 'bills#search_by_member', via: :get
  get '/bills/subject/:query', to: 'bills#search_by_query'
  get '/search/:term', to: 'members#search'
end
