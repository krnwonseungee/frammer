Frammer::Application.routes.draw do
  root 'welcome#index'
  match "/generate" => "translations#generate", via: [:get, :post]
end
