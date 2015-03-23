Rails.application.routes.draw do

  root 'pages#home'

  resources :locations
  resources :experiences
  resources :regions
  resources :images

  # User Routes

  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions", :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get "login", to: "users/sessions#new"
    delete "logout", to: "users/sessions#destroy"
    get "signup", to: "users/registrations#new"
    get "profile/edit", to: "users/registrations#edit", as: :edit_profile
  end

  # Anchors

  match 'anchor', to: 'anchors#anchor', via: :post
  match 'unanchor', to: 'anchors#unanchor', via: :delete

  match 'anchor_img', to: 'anchors#anchor_img', via: :post
  match 'unanchor_img', to: 'anchors#unanchor_img', via: :delete

  # Core Pages

  get '/about', to:'pages#about'
  get '/terms', to: 'pages#terms'
  get '/privacy', to: 'pages#privacy'
  get '/search', to: 'pages#search'

  # Admin Routes

  get 'admin/dashboard'

  # User Routes

  get 'profile/:id', to: 'users#show', as: :profile
  get 'profile/:id/images', to: 'users#images', as: :user_images
  get 'profile/:id/experiences', to: 'users#experiences', as: :user_experiences
  get 'dashboard', to: 'users#dashboard'

  # Badges

  get 'badges', to: 'badges#index'
  get 'badges/:id/:name', to: 'badges#show', as: :badge

  # Location

  get "location/weather", to: "locations#weather"




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
