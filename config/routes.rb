Rails.application.routes.draw do
  resources :productviews
  resources :colors
  resources :productimages
  mount Ckeditor::Engine => '/ckeditor'
  #static
  root 'static#home'
  get 'creation', to: 'static#creation'
  get 'philanthropy', to: 'static#philanthropy'
  get 'brand', to: 'static#brand'

  resources :stories
  resources :productimages
  resources :products, path: 'collection'

end
