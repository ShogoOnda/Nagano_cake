Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root :to =>"homes#top"
    get "/about"=>"homes#about", as: 'about'
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update]
    get "/customers/unsubscribe"=>"customers#unsubscribe", as: 'unsubscribe'
    patch "/customers/withdraw"=>"customers#withdraw", as: 'withdraw'
    resources :cart_items, only: [:index, :update, :detroy, :create]
    delete "/cart_items/destroy_all" => "cart_items#destroy_all", as: 'destroy_all'
    resources :orders, only: [:new, :create, :index, :show]
    post "/orders/confirm"=>"orders#confirm", as: 'confirm'
    get "/orders/complete"=>"orders#complete", as: 'complete'
    resources :addresses, only: [:index, :edit, :create, :update, :detroy]
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    root :to =>"homes#top"
    get "admin/home/about"=>"admin/homes#about", as: 'about'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

end
