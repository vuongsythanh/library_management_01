Rails.application.routes.draw do
  namespace :admin do
    concern :paginatable do
      get "(page/:page)", action: :index, on: :collection, as: ""
    end
    resources :categories, concerns: :paginatable
    resources :users
    resources :export_cate_excel
    resources :publishers
    resources :export_pub_excel
    resources :authors
    resources :export_auth_excel
    root "dashboards#index"
  end

  get "english", to: "set_language#english"
  get "vietnam", to: "set_language#vietnam"
  get "contact", to: "static_pages#contact"
  get "about", to: "static_pages#about"
  get "help", to: "static_pages#help"
  root "static_pages#home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
