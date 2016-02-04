Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "omniauth_callbacks"}
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   # root 'user#index'

  # resources :users

  # get ''

  # resources :users
  get 'users/basic' => 'users#edit_basic', as: :basic
  match 'users/update_basic' => 'users#update_basic', as: :update_basic, via: [:post, :patch]

  get 'users/education' => 'users#edit_education', as: :educations
  patch 'users/update_education' => 'users#update_education', as: :update_education

  get 'users/project' => 'users#edit_project', as: :projects
  patch 'users/update_project' => 'users#update_project', as: :update_project

  get 'users/experience' => 'users#edit_experience', as: :experiences
  patch 'users/update_experience' => 'users#update_experience', as: :update_experience

  get 'users/skill' => 'users#edit_skill', as: :skills
  patch 'users/update_skill' => 'users#update_skill', as: :update_skill


  devise_scope :user do
   authenticated :user do
     root :to => 'users#edit_basic'
   end
   unauthenticated :user do
     root :to => 'users#index', as: :unauthenticated_root
   end
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
