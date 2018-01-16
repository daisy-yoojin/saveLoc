Rails.application.routes.draw do
  get 'notices/new'
  post 'notices/create'
  get 'notices/edit/:id' => 'notices#edit'
  post 'notices/update/:id' => 'notices#update'
  delete 'notices/destroy/:id' => 'notices#destroy'
  get 'notices/show/:id' => 'notices#show'



  # get 'replies/create'


  get 'markers/new'
  post 'markers/create'

  post 'post_replies/create'
  delete '/post_replies/destroy/:id' => 'post_replies#destroy'

  post 'notice_replies/create'
  delete '/notice_replies/destroy/:id' => 'notice_replies#destroy'
  # get '/pic' => 'pic#upload'

  resources :posts
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'welcome#index'
  
  get 'followers/show'
  post 'followers/like'
  get 'followers/rank'
  get 'followers/search_user'
  get 'followers/search_follower'
  post 'followers/search'
  # get 'followers/search/:user_email/'=> 'followers#search'
  get 'followers/search/:user_id/'=> 'followers#search'


  get 'info/edit'
  post 'info/update'
  delete 'info/destory/:id' => 'info#destroy'

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
