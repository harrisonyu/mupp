Mupp::Application.routes.draw do

  root :to => 'home#public'

  match '/database' => 'data#index', :as => :data

  get   '/database/song/new' => 'song#new', :as => :new_song
  post  '/database/song/create' => 'song#create', :as => :create_song
  get   '/database/song/lastfmscrape' => 'song#lastfmscrape', :as => :lastfmscrape_song
  get   '/database/song/delete/:id' => 'song#delete', :as => :delete_song
  put   '/database/song/lyricsupdate/:id' => 'song#lyricsupdate', :as => :lyricsupdate_song
  get   '/database/song/lyricsupdateform/:id' => 'song#lyricsupdateform', :as => :lyricsupdateform_song
  put   '/database/song/linkupdate/:id' => 'song#linkupdate', :as => :linkupdate_song
  get   '/database/song/linkupdateform/:id' => 'song#linkupdateform', :as => :linkupdateform_song
  put   '/database/song/songnameupdate/:id' => 'song#songnameupdate', :as => :songnameupdate_song
  get   '/database/song/songnameupdateform/:id' => 'song#songnameupdateform', :as => :songnameupdateform_song

  get   '/database/location/new' => 'location#new', :as => :new_location
  post  '/database/location/create' => 'location#create', :as => :create_location
  get   '/database/location/lastfmscrape' => 'location#lastfmscrape', :as => :lastfmscrape_location
  get   '/database/location/delete/:id' => 'location#delete', :as => :delete_location

  get   '/database/reason/new' => 'reason#new', :as => :new_reason
  post  '/database/reason/create' => 'reason#create', :as => :create_reason
  get   '/database/reason/lastfmscrape' => 'reason#lastfmscrape', :as => :lastfmscrape_reason
  get   '/database/reason/delete/:id' => 'reason#delete', :as => :delete_reason
  put   '/database/reason/update/:id' => 'reason#update', :as => :update_reason
  get   '/database/reason/updateform/:id' => 'reason#updateform', :as => :updateform_reason

  get   '/database/artist/new' => 'artist#new', :as => :new_artist
  post  '/database/artist/create' => 'artist#create', :as => :create_artist
  get   '/database/artist/lastfmscrape' => 'artist#lastfmscrape', :as => :lastfmscrape_artist
  get   '/database/artist/delete/:id' => 'artist#delete', :as => :delete_artist

  post  '/home/selectLocation' => 'home#selectLocation', :as => :selectLocation_home
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
