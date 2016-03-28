Rails.application.routes.draw do
   devise_for :users
   root 'static_pages#home'
   get 'static_pages/about', as: 'about'   
   get 'follows/followers/', to: 'follows#followers'
    get 'follows/follow/', to: 'follows#follow'

   resources :users , only: [:show, :index] do
   		resources :services
   		resources :follows, :only => [:create, :destroy]
   		resources :orders, only: [:new, :create]
   		member do
			get 'follow'
			get 'followers'   			
   		end
   				
   end

   
end