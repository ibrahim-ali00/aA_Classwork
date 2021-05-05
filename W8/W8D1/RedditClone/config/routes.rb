Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do 
      resources :subs, except: [:show, :index]
  end 
  resources :posts, except: [:index]
  resources :subs, only: [:show, :index] do 
      resources :posts, only: [:create]
  end 
  resource :session, only: [:create, :new, :destroy]

end
