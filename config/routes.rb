Fitinaplace::Application.routes.draw do
  resources :negociations, :collection => {:update_status => :post}

  resources :resources

  resources :offerings

  resources :events
  resources :houses
  resources :questions

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  devise_for :houses
  resources :users, :only => :show
end
