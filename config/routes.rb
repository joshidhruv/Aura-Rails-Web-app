TeamAura::Application.routes.draw do
  
  get "account/MyAccount"
  get "calendar" => 'calendar#index'
  resources :service_locations

  resources :addons

  resources :payments

  resources :appointments

  resources :services

  resources :user_services

  resources :location_hours

  resources :companies

  resources :locations

  resources :roles

  devise_for :users

  get 'company/:id/locations' => 'locations#index'
  root :to => 'default#index'

  get 'account'=>'account#index'
  get 'account/staff'=>'account#listStaff'
  get '/account/staff/edit/:id', :to => 'account#editStaff', :as => :account_staff_edit
  get '/account/staff/edit', :to =>'account#editStaff', :as => :account_staff_new
  post '/account/staff/create', :to =>'account#createStaff', :as => :account_staff_create
  post '/account/staff/update/:id', :to =>'account#updateStaff', :as => :account_staff_update
  get '/account/staff/delete/:id', :to =>'account#destroyStaff', :as => :account_staff_delete

  get '/account/locations', :to => 'locations#index',  :as => :list_account_locations_path
  get '/account/locations/new', :to => 'locations#new', :as => :new_account_location_path
  get '/account/locations/edit/:id', :to => 'locations#edit', :as => :edit_account_location_path
  post '/account/locations/create', :to =>'locations#create', :as => :create_account_locations_path
  post '/account/locations/update/:id', :to =>'locations#update', :as => :update_account_locations_path
  get '/account/locations/delete/:id', :to =>'locations#destroy', :as => :delete_account_locations_path
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
