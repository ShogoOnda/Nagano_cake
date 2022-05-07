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
    get "/customers/my_page" => "customers#show", as: "customers"
    get "/customers/unsubscribe"=>"customers#unsubscribe", as: 'unsubscribe'
    patch "/customers/withdraw" => "customers#withdraw", as: 'withdraw'
    delete "/cart_items/destroy_all" => "cart_items#destroy_all", as: 'destroy_all'
    post "/orders/confirm"=>"orders#confirm", as: 'confirm'
    get "/orders/complete"=>"orders#complete", as: 'complete'
    resources :customers, only: [:show, :edit, :update]
    resources :items, only: [:show, :index]
    resources :cart_items, only: [:create, :index, :update, :destroy]
    resources :orders, only: [:new, :index, :show, :create]
    resources :addresses, only: [:edit, :index, :create, :update, :destroy]
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
    patch "/orders/:id/status" => "orders#status_update", as: "status" # 注文ステータスupdate
    patch "/orders/:id/making_status" => "orders#making_status_update", as: "making_status" # 製作ステータスupdate
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

end
