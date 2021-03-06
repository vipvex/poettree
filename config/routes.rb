Rails.application.routes.draw do

  resources :users, :only => [:edit, :update]
  post '/admin_login' => 'users#admin_login'

  resources :lesson_completeds
  
  resources :lesson_groups do
    resources :lessons do
      member do
        post :complete, as: :complete
      end
    end
  end
  
  get '/poettree' => 'poems#index'
  get '/poettree/my_poems' => 'poems#my_poems'

  get '/my_poems' => 'poems#edit_my_poems'


  get '/editor' => 'lesson_groups#index'
  get '/poem_editor' => 'poems#poem_editor'
  
  
  resources :poems do
  
    collection do
      get :search
    end
    
  end
  
  devise_for :users, :controllers => {
      :omniauth_callbacks => "users/omniauth_callbacks" 
    }
    devise_scope :user do
      get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
      delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  root 'static_pages#home'
  
  get 'about_us', to: 'static_pages#about_us'
  get 'dashboard', to: 'static_pages#dashboard', as: :dashboard

  get 'tos', to: 'static_pages#tos'
  get 'privacy', to: 'static_pages#privacy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
