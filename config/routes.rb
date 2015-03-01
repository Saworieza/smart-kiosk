Rails.application.routes.draw do

  resources :stores
  resources :kiosks
  resources :items
  resources :analytics, only: [:index]
  resources :users, only: [:index, :show] do
    post 'send_coupon'
  end

  resources :kiosk_sessions, only: [:new, :create]
  delete 'kiosk_sessions/sign_out', as: :destroy_kiosk_session

  namespace :api, defaults: { format: :json} do
    namespace :v1 do
      resources :users, only: [:create, :show]
      resources :devices, only: [:create, :show]
      resources :kiosks, only: [:create, :destroy]
      resources :items, only: [:index]
    end
  end

  devise_for :vendors

  authenticated :vendor do
    root to: "vendors#index", as: "vendor_home"
  end

  unauthenticated :vendor do
    root 'static_pages#index'
  end

  get 'static_pages/test_gcm'
  get 'static_pages/kiosk', as: :kiosk_landing
  get 'static_pages/kiosk_user_profile', as: :kiosk_profile
  get 'customer_services/agent' => 'customer_services#agent'
  post 'twilio/connect_customer' => 'twilio#connect_customer'
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
