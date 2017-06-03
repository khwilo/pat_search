Rails.application.routes.draw do
#  get 'search/index'

  root 'static_pages#home'
  
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete 'logout',   to: 'sessions#destroy'
  get    'search',   to: 'search#index'

  get  'welcome/index'
  resources :users
end
