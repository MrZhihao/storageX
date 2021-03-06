Rails.application.routes.draw do
  get 'bookings/show_review'

  get 'listings/show_review'

  # resources :reviews
  resources :customers, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'customers#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :customers

  # nested RESTful routes
  resources :bookings do
    member do
      get :show_review
      resources :reviews
    end

  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'listings#index'
  get 'listings/mine', to: 'listings#my_listings_index', as: 'show_mine'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products



  get 'listings/index' => 'listings#index'

  post 'bookings/new' => 'bookings#new'

  post 'reviews/new' => 'reviews#new'

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
  # resources :listings do
  #
  # end
  resources :listings do
    member do
      get :show_review
    end
  end

  resources :listings do
    resources :images, :only => [:create, :destroy]
  end

  get 'users/index'

  put 'users/index', :action => 'login_attempt', :controller => 'users'

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
  resources :user
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
