Rails.application.routes.draw do
  get 'admin/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :articles, param: :slug
  resources :admin, only: %i[index]
end
