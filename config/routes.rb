Rails.application.routes.draw do


root to: 'pages#home'

# devise_for :users

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # resources :usertips, only: [:update, :create]


resources :users, only: [:show, :edit, :update] do
  resources :collections, only: [:index, :show, :new, :create]
  resources :savedplaces, only: [:index, :show, :edit, :update] do
    resources :userpics, only: [:create]
    resources :usertips, only: [:update]
  end
end

resources :collectedplaces, only: [:new, :create]

  resources :usertips, only: [:create]

  resources :places, only: [:index, :new, :show, :create, :update, :destroy] do
    get "add", to: "places#add", as: "add", on: :collection
  end




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
