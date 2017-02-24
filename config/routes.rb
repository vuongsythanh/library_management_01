Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vn/ do
    namespace :admin do
      resources :categories
    end

    get "english", to: "set_language#english"
    get "vietnam", to: "set_language#vietnam"
    get "contact", to: "static_pages#contact"
    get "about", to: "static_pages#about"
    get "help", to: "static_pages#help"
    root "static_pages#home"
    get "/login", to: "sesions#new"
    post "/login", to: "sesions#create"
    delete "/logout", to: "sesions#destroy"
  end
end
