Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bloggers
  resources :destinations
  resources :posts
  post 'posts/:id', to: 'posts#update_like', as: 'like_post' 

end
