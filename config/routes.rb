Rails.application.routes.draw do
  get 'tags/create'
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles, param: :slug do
    resources :tags
  end

  get 'admin', to: 'admin#index'
  namespace :admin do
    resources :pages, only: %i[index edit update]
  end
end
