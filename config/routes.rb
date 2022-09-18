Rails.application.routes.draw do
  #管理者と会員で別々のcontrollerを利用した処理にするため、分けて記載
  devise_for :customers,controllers: {
    sessions:     'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :admins,controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :customers, :admins
  # 会員側のルーティング設定
  # 商品
  get 'items' => 'public/items#index'
  get 'items/:id' => 'public/items#show',as:'item'
  # 会員
  get 'customers' => 'public/customers#index'
  get 'customers/my_page' => 'public/customers#show',as:'my_page'
  get 'customers/information/edit' => 'public/customers#edit',as:'edit_my_page'
  patch '/customers/information' => 'public/customers#update'
  get '/customers/unsubscribe' => 'public/customers#unsubscribe',as:'unsubscribe'
  patch '/customers/withdraw' => 'public/customers#withdraw'
  # カート機能
  get '/cart_items' => 'public/cart_items#index'
  patch '/cart_items/:id' => 'public/cart_items#update'
  delete '/cart_items/:id' => 'public/cart_items#destroy'
  delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all'
  post '/cart_items' => 'public/cart_items#create'
  # 商品機能
  get '/orders/new' => 'public/orders#new'
  post '/orders/confirm' =>'public/orders#confirm',as:'confirm'
  get '/orders/complete' => 'public/orders#complete',as:'complete'
  get '/orders' => 'public/orders#index'
  post '/orders' => 'public/orders#create'
  get '/orders/:id' => 'public/orders#show',as:'order'

  # 管理者側のルーティング設定
  namespace :admin do
    #管理者トップページ
    get '/admin' => 'admin/homes#top'
    #商品
    get '/items' => 'admin/items#index'
    get '/items/new' => 'admin/items#new'
    post '/items' => 'admin/items#create'
    get '/items/:id' => 'admin/items#show',as:'item'
    get '/items/:id/edit' => 'admin/items#edit',as:'item_edit'
    patch '/items/:id' => 'admin/items#update'
    #顧客情報関係
    get '/admin/customers' => 'admin/customers#index'
    get '/admin/customers/:id' => 'admin/customers#show',as:'customer'
    get '/admin/customers/:id/edit' => 'admin/customers#edit',as:'customer_edit'
    patch'/admin/customers/:id' => 'admin/customers#update'
  end

  #topページはapp/views/homes/topで設定
  root to:"homes#top"
  #aboutページはapp/views/homes/aboutで設定
  get 'about'=>'homes#about' ,as:'about'
end
