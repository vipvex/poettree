Rails.application.routes.draw do

  resources :lesson_completeds
  
  resources :lesson_groups do
    resources :lessons do
      member do
        post :complete, as: :complete
      end
    end
  end
  
  
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


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
