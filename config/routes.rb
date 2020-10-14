Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get "tweets/index"
 resources :sessions, only:[:new, :create, :destroy]
 resources :users do
 	resources :tweets, only:[:new, :create, :show, :destroy] do
 		resources :comments, only:[:create]
 	end
 end

 root "users#index"
end