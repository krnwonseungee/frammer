Frammer::Application.routes.draw do
  get "/generate", :to => "translators#generate"
  root 'welcome#index'
end
