Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles, param: :slug

  get 'admin', to: 'admin#index'
  namespace :admin do
    resources :pages, only: %i[index edit update]
  end
end
