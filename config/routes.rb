Frammer::Application.routes.draw do
  match "/generate" => "translators#generate", via: [:get, :post]
  root 'welcome#index'
end
