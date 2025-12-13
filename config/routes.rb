Rails.application.routes.draw do

  # 管理者用
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end

  # ユーザー用　(public名前空間にまとめる)
  scope module: :public do
    devise_for :users

    root to: 'users#mypage'
    get 'homes/about', to: 'homes#about', as: :about

    get 'users/mypage'
    resources :users
    resources :spots do
      resources :post_comments, only: [:create, :destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end