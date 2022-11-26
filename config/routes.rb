Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  get 'users/update'
  get 'books/new'
  get 'books/create'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  get 'books/update'
  get 'books/destroy'
  get '/homes/about', to: "homes#about", as: "about"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
end
