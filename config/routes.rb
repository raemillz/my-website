Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :projects, only: [:index, :new, :create, :show, :edit, :destroy]
  resources :admins, only: [:index, :new, :create, :show, :edit, :destroy]

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'sessions' => 'sessions#new'
end
