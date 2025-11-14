Rails.application.routes.draw do
  get 'users/mypage'
  devise_for :users
  resources :spots
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#mypage'
  get 'about', to: 'homes#about'
  
end