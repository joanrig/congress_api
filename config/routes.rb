Rails.application.routes.draw do
  get 'financial/disclosures'
  resources :bills
  resources :members, only: [:index, :show]
  root :to => 'members#index'


  match '/search/bills/member/:id', to: 'bills#search_by_member', via: :get
  get '/bills/subject/:query', to: 'bills#search_by_query', via: :get
  get '/search/:term', to: 'members#search'
  get '/search/financial_disclosures/member/:id', to: 'financial_disclosures#get_member_finances'
end
