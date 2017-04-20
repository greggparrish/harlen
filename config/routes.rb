Rails.application.routes.draw do
  #static
  root 'static#home'
  get 'creation', to: 'static#creation'
  get 'philanthropy', to: 'static#philanthropy'
  get 'story', to: 'static#story'
end
