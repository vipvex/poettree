Rails.application.routes.draw do

  root 'static_pages#home'
  
  get 'about_us', to: 'static_pages#about_us'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
