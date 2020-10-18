Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root "homes#top"

 resources :sessions, only:[:new, :create, :destroy]

 resources :users
 resources :tweets, only:[:index, :new, :create, :show, :destroy] do
 	resources :comments, only:[:create]
 end
end