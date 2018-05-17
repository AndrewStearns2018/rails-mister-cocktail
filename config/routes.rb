Rails.application.routes.draw do
  get 'doses/index'
  get 'doses/show'
  get 'doses/new'
  get 'doses/create'
  get 'cocktail/index'
  get 'cocktail/show'
  get 'cocktail/new'
  get 'cocktail/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
    resources :doses, only: [:index, :new, :create]
  end
end
