Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'visitors#index'
  get "servicios", to: "visitors#servicios"
  get "nosotros", to: "visitors#nosotros"
  get "consultar", to: "visitors#consultar"
  post "pages/update"
  get "pages/edit"
  get 'contact', to: 'mensajes#new', as: 'contact'
  post 'contact', to: 'mensajes#create'
  devise_for :users
  resources :users
  namespace :admin do
    root to: 'dashboard#index'
    resources :clientes
    resources :vehiculos
    resources :estados
    resources :pages
    resources :estado_vehiculos
  end
end
