Rails.application.routes.draw do
 
 devise_for :users

 resources :places

root to: "static_pages#landing_page"

get '/landing_page', to: 'static_pages#landing_page'

match 'like', to: 'likes#like', via: :post

match 'unlike', to: 'likes#unlike', via: :delete

end