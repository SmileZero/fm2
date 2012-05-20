Server::Application.routes.draw do
  get "manage/index"

  get "details/index"

  get "metas/new"

  get "metadatas/new"

  get "tags/new"

  get "users/new"

  get "papers/new"

  get "docs/new"
  
  get "renren/login", :controller=>"renren",:action=>"login"

  get "tags" , :controller => "users", :action=>"getTags"
  
  match 'reader' => 'reader#index'
  
  match 'renren/logout', :controller=> 'renren', :action=>"logout"
  
  match '/signout', to: 'renren#destroy', via: :delete
  
  resources :renren, only: [:destroy]

  resources :users

  resources :friends

  resources :logs  

  resources :metadata do
       resources :tags
  end  
  #resources :comments
  #resources :notes
  #resources :highlights
  
  resources :papers do
       resources :comments
       resources :highlights
       resources :notes
  end
  
  match 'home'  => 'home#index'
  match 'details/:metadata_id' => 'details#index'
  match 'manage' => 'manage#index'

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
  #

  # for easy test of static files
  # this should be removed in production env
  # match ':action' => 'static#:action'
end