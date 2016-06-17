Rails.application.routes.draw do

  # get "/posts/new" => "posts#new", as: :new_post
  # post "/posts" => "posts#create", as: :posts
  # get "/posts/search" => "posts#search"
  # get "/posts/:id" => "posts#show", as: :post
  # get "/posts" => "posts#index"
  # get "/posts/:id/edit" => "posts#edit", as: :edit_post
  # patch "/posts/:id" => "posts#update"
  # delete "/posts/:id" => "posts#destroy"



  root 'home#index'
  get "/about" => "home#about"

  get "/users/edit_password" => "users#edit_password", as: :edit_password
  patch "users"             => "users#update_password", as: :update_password
  resources :users, only: [:new, :create] do
    get :edit, on: :collection
    patch :update, on: :collection
  end
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  resources :posts do
    get :search, on: :collection

    resources :comments
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'posts/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: post.id)
  #   get 'posts/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :posts

  # Example resource route with options:
  #   resources :posts do
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
  #   resources :posts do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :posts do
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
  #     # Directs /admin/posts/* to Admin::postsController
  #     # (app/controllers/admin/posts_controller.rb)
  #     resources :posts
  #   end
end
