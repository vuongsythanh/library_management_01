Rails.application.routes.draw do

  resources :users
  get "english", to: "set_language#english"
  get "vietnam", to: "set_language#vietnam"
  root "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    concern :paginatable do
      get "(page/:page)", action: :index, on: :collection, as: ""
    end
    resources :categories, concerns: :paginatable
    resources :users, only: [:index, :destroy]
    resources :export_cate_excel
    resources :publishers
    resources :export_pub_excel
    resources :authors
    resources :export_auth_excel
    resources :books
    resources :export_book_excel
    root "dashboards#index"
  end
end
