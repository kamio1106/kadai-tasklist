Rails.application.routes.draw do

    resources :tasks
    root to: 'tasks#index'
    get "signup",to: "users#new"
    post "users",to: "users#create"
    
end
