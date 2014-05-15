Frammer::Application.routes.draw do
  root 'welcome#index'
  resources :translations, only: [:create]
end
