Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'homes/about' => 'homes#about', as: :about
  resources :books, only: [:new, :create, :edit, :update,:index, :show, :destroy]
  resources :users, only: [:show, :edit, :update, :index]
end
