Rails.application.routes.draw do



  resources :pstats

  resources :ctypes

  resources :statuses

  resources :locations

  root 'navigation#home'

  get '/work' => 'navigation#work'

  get '/about' => 'navigation#about'

  get '/contact' => 'navigation#contact'

  get '/clientele' => 'navigation#clientele'

  get '/home' => 'navigation#home'

  get '/console' => 'navigation#console'       

  get '/preview' => 'models#preview'    

  get '/instagram' => 'navigation#instagram'

  get '/portfolio' => 'projects#portfolio'

  devise_scope :admin do 
  get '/nt' => 'devise/sessions#create'
  end               



  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :clients do
      resources :projects
    end

    resources :projects do
      resources :photos do
        delete :destroy_multiple, action: :destroy, on: :collection
      end
    end

    resources :projects do

      patch :transform, action: :highlight, on: :collection

    end

  

  devise_for :admins, skip: :registrations
  
  resources :models

  resources :photographers





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
