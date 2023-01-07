Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }


  scope module: :public do
    root to: "homes#top"
    get "home/about"=> "homes#about", as: "about"
    get "mypage", to: 'customers#show'
  end
  namespace :admin do
    get "admin/top"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
