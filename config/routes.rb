Rails.application.routes.draw do

  root 'users#index'

  get '/welcome' => "users#welcome"

  # users:

  get 'users/login' => 'users#login_page'
  post 'users/login' => 'users#login'
  get 'users/logout' => 'users#logout', as: :logout
  post 'users/:id/edit' => 'users#edit'
  get 'users/:id/delete' => 'users#delete', as: :delete_user

  resources :users do
    resources :movies, only: [:index]
  end

  # movies:

  post 'movies/:id/copy' => 'movies#copy'
  post 'movies/:id/delete' => 'movies#destroy'
  post 'movies/:id/edit' => 'movies#update'
  get 'movies/search' => 'movies#search'
  resources :movies, only: [:show, :create, :index, :new, :edit]

  # uploaded images:

  post 'uploaded_images/profile' => 'uploaded_images#create_profile_picture'
  post 'uploaded_images/poster' => 'uploaded_images#create_movie_poster'
  resources :uploaded_images, only: [:show, :create]

  # other


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
