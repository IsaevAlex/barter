Rails.application.routes.draw do
   devise_for :users
   root 'static_pages#home'

   get 'follows/followers/', to: 'follows#followers'
   get 'follows/follow/', to: 'follows#follow'

   resources :users , only: [:show, :index] do
   		
   		resources :follows, :only => [:create, :destroy]
   		resources :orders, only: [:new, :create, :show]
   		member do
			   get 'follow'
			   get 'followers'   			
   		end
   				
   end

   resources :services do
         resources :images
         collection do
            get :autocomplete # <= add this line
         end
         put :favorite, on: :member
   end
   
end