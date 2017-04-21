Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  #static
  root 'static#home'
  get 'creation', to: 'static#creation'
  get 'philanthropy', to: 'static#philanthropy'
  get 'brand', to: 'static#brand'

  resources :stories

end
