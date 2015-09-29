Rails.application.routes.draw do
  root 'welcome#index'

  resources :organizations, only: [:index, :show, :destroy]
  resources :ridings, only: [:index, :show, :destroy]
end
