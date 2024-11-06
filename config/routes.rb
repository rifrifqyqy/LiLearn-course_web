Rails.application.routes.draw do

  # sign in route
  get "users/new"
  get "users/create"
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'


  # Route untuk login
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'  # Logout


  # route pages
  get "/", to: 'pages#homepage'
  get 'materi-list', to: 'pages#course_pages'
  get 'materi/:id', to: 'pages#course_per_id', as: 'coursepage'

  # routes dashboard admin
  namespace :admin do
    get "dashboard", to: "dashboard#index"
  end

  # ckeditor setup
  mount Ckeditor::Engine => '/ckeditor'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  resources :courses do
    resources :materials, except: [:index]
    resources :reviews, only: [:create]
  end
# routes untuk course/new
  root "pages#homepage"
end
