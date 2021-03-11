Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  get 'lightbulbs/search', to: 'lightbulbs#search'
  resources :lightbulbs, only: [:index, :show] do
      resources :favourites, only: [:create]
    end
  resources :favourites do
    collection do
      get :sort
    end
  end
end
