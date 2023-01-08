Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  root to: "homes#top"
  get "mypage", to: 'customers#show'
  get "mypage/edit", to: 'customers#edit'
  patch "mypage", to: 'customers#update'
  get "unsubscribe", to: 'customers#unsubscribe'
  patch "withdraw", to: 'customers#withdraw'
  get "home/about"=> "homes#about", as: "about"


  scope module: :public do

  end
  namespace :admin do
    get "homes/top", as: "top"
    resources :customers, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
