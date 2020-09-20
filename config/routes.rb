Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
        resources :articles
        get 'signup', to: 'users#new'
        resources :users, except: [:new]
        get 'login', to: 'sessions#new'
        post 'login', to: 'sessions#create'
        delete 'logout', to: 'sessions#destroy'
        resources :categories, except: [:destroy]
    end
  end
end
