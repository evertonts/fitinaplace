Fitinaplace::Application.routes.draw do

  resources :negociations do
    post :update_status, :on => :collection
  end

  resources :resources

  resources :busca do
    post :search, :on => :collection
  end

  resources :assets, :only => :create
  resources :offerings
  resources :comments, :only => [:create, :destroy, :update]
  resources :ratings, :only => [:create]
  resources :events
  resources :questions
  resources :comofunciona
  resources :about
  resources :faq
  resources :termosdeuso
  resources :termosdeseguro
  resources :confirmacao
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, :only => :show
end
