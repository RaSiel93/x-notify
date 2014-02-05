Xnotify::Application.routes.draw do
  resources :items

  resources :discounts

  resources :events

  resources :advs

  resources :users

  root :to => 'items#index'

  get '/users/:id/send', :to => 'users#show_send', :as => 'send_user'
  post '/items/:id/send', :to => 'items#send_item_id', :as => 'send_item'
	post '/users/:id/send', :to => 'users#send_message', :as => 'send'

  post '/api/reg', :to => 'users#create', :as => 'user_create'
  get '/api/items/:id(.:format)', :to => 'items#show'

end
