Rails.application.routes.draw do
 
 devise_for :users

 resources :users do
 	resources :likes
  end


 resources :places do
 	resources :likes 
 end

 root to: "static_pages#landing_page"

get '/landing_page', to: 'static_pages#landing_page'

end