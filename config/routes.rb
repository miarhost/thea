Rails.application.routes.draw do
 
 devise_for :users
 resources :places

root to: "static_pages#landing_page"

get '/landing_page', to: 'static_pages#landing_page'

  get 'places/index'

  get 'places/new'

  get 'places/show'


end