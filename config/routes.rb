Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :articles, param: :slug do
    resources :tags, param: :slug, only: %i[create destroy]
  end

  resources :tags, param: :slug, only: %i[index show]

  get 'admin', to: 'admin#index'
  get 'admin/change_password', to: 'admin#change_password'
  patch 'admin/change_password', to: 'admin#update_password'

  namespace :admin do
    resources :pages, only: %i[index edit update]
  end
end
