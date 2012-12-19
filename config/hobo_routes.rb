# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

Blog::Application.routes.draw do


  # Resource routes for controller comments
  resources :comments, :only => [:destroy]

  # Owner routes for controller comments
  resources :entries, :as => :entry, :only => [] do
    resources :comments, :only => [] do
      collection do
        post 'create', :action => 'create_for_entry'
      end
    end
  end


  # Resource routes for controller entries
  resources :entries do
    member do
      put 'publish', :action => 'do_publish'
      get 'publish'
      put 'unpublish', :action => 'do_unpublish'
      get 'unpublish'
    end
  end


  # Resource routes for controller tags
  resources :tags


  # Resource routes for controller users
  resources :users, :only => [:edit, :show, :create, :update, :destroy] do
    collection do
      post 'signup', :action => 'do_signup'
      get 'signup'
    end
    member do
      get 'account'
      put 'reset_password', :action => 'do_reset_password'
      get 'reset_password'
    end
  end

  # User routes for controller users
  match 'login(.:format)' => 'users#login', :as => 'user_login'
  get 'logout(.:format)' => 'users#logout', :as => 'user_logout'
  match 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password'

end
