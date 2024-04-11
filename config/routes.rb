Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get 'homes/about' => 'homes#about' ,as: "about"
  resources :users 
  resources :books

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  # get 'users/index'
  # get 'users/new'
  # get 'users/edit'