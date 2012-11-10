Onyx::Application.routes.draw do
  # Application
  match "application/notice" => "application#notice"

  # Interviews
  resources :interviews
  match "interviews/new" => "interviews#new"
  match "interviews/create" => "interviews#create"
  match "interviews/change_schedule" => "interviews#change_schedule"
  match "interviews/:id/show" => "interviews#show"
  match "interviews/:id" => "interviews#index"
  match "interviews/:id/add_to_queue" => "interviews#add_to_queue"
  match "interviews/:id/destroy" => "interviews#destroy"



  # Challenge
  match "challenges" => "challenges#index"
  match "challenges/new" => "challenges#new"
  match "challenges/create" => "challenges#create"
  match "challenges/error" => "challenges#error"
  match "challenges/:id/load" => "challenges#load"

  # InterviewChallenge
  match "interview_challenges/:id/destroy" => "interview_challenges#destroy"

  devise_for :users

  get "dashboard/index"

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
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
  end

  root :to => "dashboard#index"
end
