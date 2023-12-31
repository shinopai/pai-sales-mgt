Rails.application.routes.draw do
  # 認証ルート
  devise_for :users, skip: 'sessions', controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  devise_scope :user do
    get	'/users/sign_in', to: 'users/sessions#new', as: :new_user_session
    post	'/users/sign_in', to: 'users/sessions#create', as: :user_session
    get	'/users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  scope :receiving_orders do
    # 受注一覧
    get '/', to: 'receiving_orders/index#index', as: :receiving_orders

    # 新規受注作成画面
    get '/:item_id/create', to: 'receiving_orders/create/index#index', as: :receiving_orders_create

    # 新規受注作成
    post '/:item_id/create/submit', to: 'receiving_orders/create/index#submit', as: :receiving_orders_create_submit

    # 受注編集
    get '/:receiving_order_id/edit', to: 'receiving_orders/edit/index#index', as: :receiving_orders_edit

    # 受注更新
    patch '/:receiving_order_id/edit/submit', to: 'receiving_orders/edit/index#submit', as: :receiving_orders_edit_submit

    # 受注検索
    get '/search', to: 'receiving_orders/index#search', as: :receiving_orders_search
  end

  scope :items do
    # 在庫一覧
    get '/', to: 'items/index#index', as: :items

    # 在庫検索
    get '/search', to: 'items/index#search', as: :items_search

    # 在庫編集
    get '/:item_id/edit', to: 'items/edit/index#index', as: :items_edit

    # 在庫更新
    patch '/:item_id/edit/submit', to: 'items/edit/index#submit', as: :items_edit_submit
  end

  scope :orders do
    # 発注一覧
    get '/', to: 'orders/index#index', as: :orders

    # 新規発注作成画面
    get '/:item_id/create', to: 'orders/create/index#index', as: :orders_create

    # 新規発注作成
    post '/:item_id/create/submit', to: 'orders/create/index#submit', as: :orders_create_submit

    # 発注キャンセル
    post '/:order_id/create/cancel', to: 'orders/create/index#cancel', as: :orders_create_cancel

    # 発注検索
    get '/search', to: 'orders/index#search', as: :orders_search
  end
end
