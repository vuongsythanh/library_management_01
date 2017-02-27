Rails.application.routes.draw do
  scope "(:locale)", :locale => /en|vn/ do
    get "english", to: "set_language#english"
    get "vietnam", to: "set_language#vietnam"
    get "contact", to: "static_pages#contact"
    get "about", to: "static_pages#about"
    get "help", to: "static_pages#help"
    get "home", to: "static_pages#home"
    root "static_pages#home"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
  end
end
