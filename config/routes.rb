Xnotify::Application.routes.draw do
  resources :users

  root :to => 'users#index'

  get '/users/:id/send', :to => 'users#show_send', :as => 'send_user'
  post '/users/:id/send', :to => 'users#send_message', :as => 'send'

  post '/api/reg', :to => 'users#create', :as => 'user_create'
end
