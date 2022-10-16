BGM::Application.routes.draw do
  get 'members', :to => 'users#members'
  get 'files', :to => 'users#files'

  get '/:name', :to => 'users#show', :as => :user
end
