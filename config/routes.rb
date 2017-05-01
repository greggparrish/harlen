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
  get 'faq', to: 'static#faq'
  get 'contact', to: 'static#contact'
  get 'mailing-list', to: 'static#mailing_list'
  get 'legal', to: 'static#legal'
  get 'terms', to: 'static#terms'

  resources :pressitems, path: 'press'
  resources :productimages
  resources :products, path: 'collection'
  resources :stories

end
