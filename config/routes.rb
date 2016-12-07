Rails.application.routes.draw do
    get "reports/historial"
    get "reports/asignados"
    get "reports/historialTecnico"
    get "reports/asignadosTecnico"
    get "reports/historialUsuario"
    get "reports/creadosUsuario"
    get "reports/procesoUsuario"
    get "reports/welcome"
    get "companies/usuarios"
    get "companies/tecnicos"
    
  devise_for :users, :path_names => { :sign_up => "*AUSecure*" }, :controllers => {:registrations => "registrations"}
    resources :companies, except: [:delete]
    resources :reports, except: [:delete]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   devise_scope :user do
        root :to => 'devise/sessions#new'
   end
    
    

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
