BGM::Application.routes.draw do
  default_url_options :host => 'localhost'

  mount Thredded::Engine => '/forums'
  mount Peek::Railtie => '/peek'

  root :to => 'application#index', :via => 'get'

  resources :projects, :param => :slug
  resources :repositories, :param => :slug, :path => :revisions

  get 'rules', :to => 'rules#index'
  get 'trademark', :to => 'trademark#index'

  match '404', :to => 'errors#not_found', :via => :all
  match '422', :to => 'errors#illegal', :via => :all
  match '500', :to => 'errors#internal_error', :via => :all

  # Route for testing error pages in the development environment
  get 'error' => 'errors#illegal'

  devise_for :users,
             :controllers => {
               :confirmations => 'confirmations',
               :registrations => 'registrations'
             },
             :path_names => {
               :sign_in => 'login',
               :sign_out => 'logout',
               :sign_up => 'register',
               :password => 'forgot',
               :confirmation => 'confirm'
             }

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    post '/login' => 'devise/sessions#create'
    delete '/logout' => 'devise/sessions#destroy'

    post '/forgot' => 'devise/passwords#create'
    get '/forgot' => 'devise/passwords#new'
    get '/forgot/:reset_password_token' => 'devise/passwords#edit'
    put '/forgot' => 'devise/passwords#update'

    post '/register' => 'registrations#create'
    get '/register' => 'registrations#new'
    get '/account' => 'registrations#edit'
    put '/account' => 'registrations#update'

    post '/confirm' => 'confirmations#create'
    get '/confirm' => 'confirmations#new'
    get '/confirm/:confirmation_token' => 'confirmations#show', :as => :confirmify
    put '/confirm' => 'confirmations#confirm_account', :as => :finalize_confirmation
  end
end
