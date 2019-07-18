Rails.application.routes.draw do
  resources :members
  root :to => 'members#index'
end
