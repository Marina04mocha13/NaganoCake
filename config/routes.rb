Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  root to: "homes#top"
  get "mypage", to: 'customers#show'
  get "home/about"=> "homes#about", as: "about"

  scope module: :public do
  end
  namespace :admin do
    get "homes/top", as: "top"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
