BGM::Application.routes.draw do
  default_url_options :host => 'localhost'

  mount Thredded::Engine => '/forums'
  mount Peek::Railtie => '/peek'

  root :to => 'application#index', :via => 'get'

  resources :profiles
  resources :projects, :param => :slug
  resources :repositories, :param => :slug, :path => :revisions

  get 'rules', :to => 'rules#index'
  get 'trademark', :to => 'trademark#index'

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
