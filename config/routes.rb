SeriesTracker::Application.routes.draw do

controller :sessions do
  get 'login' => :new
  post 'login' => :create
  delete 'logout' => :destroy
end

controller :search do
  get 'search' => :new
  post 'search' => :create
  
end

controller :users do
  get 'register' => :new
  get 'forgot_password' => :insert_forgot_password
  post 'send_email_forgotten_password' => :forgot_password
end

controller :messages do
  get 'sent_messages' => :index_sent
  get 'sent_messages/show' => :show_sent
  post 'delete_from' => :delete_from
  post 'delete_to' => :delete_to
end

resources :messages

resources :users

resources :series do
  resources :seasons do
    resources :episodes
  end
end

  match 'reset_password/:id' => "users#reset_password"
  match 'edit_user_password/:id' => "users#edit_password"
  
  get "home/index"

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
  root :to => "series#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
