Rails.application.routes.draw do
  namespace :api do
    resources :expenses, only: [:create]
    get 'search', to: 'creatures#search'
    get 'creatures', to: 'creatures#index' 
  end
end
