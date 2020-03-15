Rails.application.routes.draw do
  get '/' => "home#top"

  get 'posts/index' => "posts#index"
  get 'posts/new' => "posts#new"
  post "posts/create" => "posts#create"
  get 'posts/:id' => "posts#show"
  get 'posts/:id/edit' => "posts#edit"
  post 'posts/:id/update' => "posts#update"
  post 'posts/:id/destroy' => "posts#destroy"

  get 'signup' => "users#new"
  post 'users/create' => "users#create"
  get 'users/index' => "users#index"
  get 'users/:id' => "users#show"
  get 'users/:id/edit' => "users#edit"
  post 'users/:id/update' => "users#update"
end
