Xnotify::Application.routes.draw do
  namespace :items do
    resources :advs, :events, :discounts
  end

  resources :items
  post '/items/:id/send', :to => 'items#send_item_id', :as => 'send_item'
  
  root to: 'items#index'
  
  # resources :users

  # root :to => 'items#index'

  # get '/users/:id/send', :to => 'users#show_send', :as => 'send_user'
	# post '/users/:id/send', :to => 'users#send_message', :as => 'send'

  # post '/api/reg', :to => 'users#create', :as => 'user_create'
  # get '/api/items/:id(.:format)', :to => 'items#show'

end
