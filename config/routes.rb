Rails.application.routes.draw do
  resources :articles, except: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: "pages#about"
  get '/404', to: "errors#not_found"
 end
