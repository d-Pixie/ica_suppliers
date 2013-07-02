ICASuppliers::Application.routes.draw do
  get "home/index" => "home#index"
  get "home/about" => "home#about"

  resources :categories

  resources :suppliers

  #get "home/index"
  
  root :to => "home#index"
end
