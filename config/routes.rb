Rails.application.routes.draw do
  root 'welcome#index'

  resources :organizations, only: [:index, :show, :destroy]
  get '/organizations/:id/funding_data', to: 'organizations#funding_data',
    as: 'funding_data'

  resources :ridings, only: [:index, :show, :destroy]
  get '/ridings/:id/organizations', to: 'ridings#organizations',
    as: 'riding_organizations'
  post '/ridings/my_riding', to: 'ridings#get_my_riding',
    as: 'get_my_riding'

  # search paths
  get '/search/organizations', to: 'organizations#search',
    as: 'org_search'
  get '/search/ridings', to: 'ridings#search',
    as: 'riding_search'
end
