Rails.application.routes.draw do
  #管理者と会員で別々のcontrollerを利用した処理にするため、分けて記載
  #デフォルトで作成されるパスワードのルーティングを省略
  devise_for :customers,skip: [:passwords],controllers: {
    sessions:     'public/sessions',
    registrations: 'public/registrations'
  }

  #デフォルトで作成されるパスワード＆登録のルーティングを省略
  devise_for :admins, skip: [:registrations, :passwords],controllers: {
    sessions:      'admin/sessions',
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 会員側のルーティング設定
  # 商品
  resources :items, only: [:index,:show], module: 'public'
  #get 'items' => 'public/items#index'
  #get 'items/:id' => 'public/items#show',as:'item'

  # 会員

  resource :customers, only: [:index], module: 'public' do
    collection do
      get 'unsubscribe'
      patch 'withdraw'
    end
  end

  #get 'customers' => 'public/customers#index'
  get 'customers/my_page' => 'public/customers#show',as:'my_page'#resourceで書いた場合パス名が「customers」になるためそのま--public/sessions_controller.rbのPath名は修正済み
  get 'customers/information/edit' => 'public/customers#edit',as:'my_page_edit'
  patch '/customers/information' => 'public/customers#update'
  #get 'customers/unsubscribe' => 'public/customers#unsubscribe',as:'unsubscribe'
  #patch 'customers/withdraw' => 'public/customers#withdraw'

  # カート機能
  resources :cart_items, only: [:index,:create,:destroy], module: 'public' do
    collection do
      delete 'destroy_all'
    end
  end
  #get '/cart_items' => 'public/cart_items#index'
  patch '/cart_items/:id' => 'public/cart_items#update'
  #delete '/cart_items/:id' => 'public/cart_items#destroy'
  #delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all'
  #post '/cart_items' => 'public/cart_items#create'

  # 商品機能
  resources :orders, only: [:index, :new, :create,:show], module: 'public' do
    collection do
      post 'confirm'
      get 'complete'
    end
  end
  #get '/orders/new' => 'public/orders#new'
  #post '/orders/confirm' =>'public/orders#confirm',as:'confirm'
  #get '/orders/complete' => 'public/orders#complete',as:'complete'
  #get '/orders' => 'public/orders#index'
  #post '/orders' => 'public/orders#create'
  #get '/orders/:id' => 'public/orders#show',as:'order'

  # 配送先機能
  resources :addresses, only: [:index,:create,:edit,:update,:destroy], module: 'public'
  #get '/addresses' => 'public/addresses#index'
  #get '/addresses/:id/edit' =>'public/addresses#edit',as:'address_edit'
  #post '/addresses' => 'public/addresses#create'
  #patch '/addresses/:id' => 'public/addresses#update'
  #delete '/addresses/:id' => 'public/addresses#destroy'

  # 管理者側のルーティング設定
  namespace :admin do
    #管理者トップページ
    get '' => 'homes#top',as:'top'
    #商品
    resources :items, only: [:index, :new,:create,:show,:edit,:update]
    #get 'items' => 'items#index'
    #get 'items/new' => 'items#new'
    #post 'items' => 'items#create'
    #get 'items/:id' => 'items#show',as:'item'
    #get 'items/:id/edit' => 'items#edit',as:'item_edit'
    #patch 'items/:id' => 'items#update'

    #ジャンル
    #resources :genres, only: [:index,:create,:edit,:update]
    #get 'genres' => 'genres#index'
    #post 'genres' => 'genres#create'
    #get 'genres/:id/edit' => 'genres#edit',as:'genre_edit'
    #patch'genres/:id' => 'genres#update'

    #顧客情報関係
    resources :customers, only: [:index,:show,:edit,:update]
    #get 'customers' => 'customers#index'
    #get 'customers/:id' => 'customers#show',as:'customer'
    #get 'customers/:id/edit' => 'customers#edit',as:'customer_edit'
    #patch'customers/:id' => 'customers#update'

    #注文機能
    resources :orders, only: [:index,:show,:update] do
      resources :order_details, only: [:update],as:'details'
    end
    #get 'orders' => 'orders#index'
    #get 'orders/:id' => 'orders#show',as:'order'
    #patch 'orders/:id' => 'orders#update'

    #注文詳細
    #patch 'order_details/:id' => 'order_details#update'
  end

  #topページはapp/views/public/homes/topで設定
  root to:"public/homes#top"
  #aboutページはapp/views/public/homes/aboutで設定
  get 'about'=>'public/homes#about' ,as:'about'
end