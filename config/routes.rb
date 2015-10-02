Rails.application.routes.draw do
  root 'welcome#index'

  resources :organizations, only: [:index, :show, :destroy]
  get '/organizations/:id/funding_data', to: 'organizations#funding_data',
    as: 'funding_data'
  resources :ridings, only: [:index, :show, :destroy]
end
