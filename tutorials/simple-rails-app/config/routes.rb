Rails.application.routes.draw do
  get 'user/create'
  get 'oauth2callback', to: 'user#add_or_update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
