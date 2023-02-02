Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
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
    resources :items, only: [:index,:show]
    delete "cart_items/destroy_all", to: 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post :confirm
        get :complete
      end
    end
    resources :addresses, only: [:index, :edit, :update, :destroy, :create]
    get "search_genre" => "items#search_genre"
  end
  namespace :admin do
    root to: "homes#top"
    resources :customers, only: [:index]
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
