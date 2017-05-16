Rails.application.routes.draw do
  #USERS
  devise_for :users

  #CRUD  
  resources :users
  resources :pressitems, path: 'press'
  resources :products, path: 'collection'
  resources :stories
  resource :order, only: [:show], path: 'cart'
  resources :order_items, only: [:create, :update, :destroy]
  mount Ckeditor::Engine => '/ckeditor'

  #STATIC
  root 'static#home'
  #FOOTER
  get 'faq', to: 'static#faq'
  get 'contact', to: 'static#contact'
  get 'mailing-list', to: 'static#mailing_list'
  get 'legal', to: 'static#legal'
  get 'terms', to: 'static#terms'
  #DISCOVER
  get 'discover/creation', to: 'static#creation'
  get 'discover/philanthropy', to: 'static#philanthropy'
  get 'discover/brand', to: 'static#brand'

end
