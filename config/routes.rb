Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about' ,as: "about"
  resources :users
  resources :books do
    resource :favorite, only: [:create, :destroy] 
    resources :book_comments, only: [:create, :destroy]
  end

end
