Mupp::Application.routes.draw do

  root :to => 'home#public'

  match '/database' => 'home#index', :as => :home

  get   '/home/song/new' => 'song#new', :as => :new_song
  post  '/home/song/create' => 'song#create', :as => :create_song
  get   '/home/song/delete/:id' => 'song#delete', :as => :delete_song

  get   '/home/location/new' => 'location#new', :as => :new_location
  post  '/home/location/create' => 'location#create', :as => :create_location
  get   '/home/location/lastfmscrape' => 'location#lastfmscrape', :as => :lastfmscrape_location
  get   '/home/location/delete/:id' => 'location#delete', :as => :delete_location

  get   '/home/reason/new' => 'reason#new', :as => :new_reason
  post  '/home/reason/create' => 'reason#create', :as => :create_reason
  get   '/home/reason/lastfmscrape' => 'reason#lastfmscrape', :as => :lastfmscrape_reason
  get   '/home/reason/delete/:id' => 'reason#delete', :as => :delete_reason
  put   '/home/reason/update/:id' => 'reason#update', :as => :update_reason
  get   '/home/reason/updateform/:id' => 'reason#updateform', :as => :updateform_reason

  get   '/home/artist/new' => 'artist#new', :as => :new_artist
  post  '/home/artist/create' => 'artist#create', :as => :create_artist
  get   '/home/artist/lastfmscrape' => 'artist#lastfmscrape', :as => :lastfmscrape_artist
  get   '/home/artist/delete/:id' => 'artist#delete', :as => :delete_artist
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
