Rails.application.routes.draw do

  devise_for :users, path: 'users', path_names: { sign_up: 'sign_up'}, :controllers  => {:registrations => 'users/registrations', :omniauth_callbacks => "users/omniauth_callbacks"}

  get 'families/sign_up' => 'families#new', as: 'new_family'
  get 'families/:id/users' => 'families#users_index', as: 'family_users'
  get 'families/:id/users/:user_id' => 'users#show', as: 'user'

  get 'families/:id/chores/new' => 'chores#new', as: 'new_chore'
  post 'families/:id/chores' => 'chores#create', as: 'chores'

  root 'static#index', as: 'root'

  get 'tasks/last_completed' => 'tasks#last_completed', as: 'last_completed_task'

  resources :tasks
  resources :chores, except: [:new, :create]

#  resources :users, only: [:show]
  resources :families, except: [:new]

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
