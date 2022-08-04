BGM::Application.routes.draw do
  get 'new_users', :to => 'users#new_users'
  get 'files', :to => 'users#files'

  get '/:name', :to => 'users#show', :as => :user
end
