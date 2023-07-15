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
  end

  scope :items do
    # 在庫一覧
    get '/', to: 'items/index#index', as: :items

    # 在庫検索
    get '/search', to: 'items/index#search', as: :items_search
  end

end
