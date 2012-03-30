Fitinaplace::Application.routes.draw do
  resources :events
  resources :houses

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  devise_for :houses
  resources :users, :only => :show
end
