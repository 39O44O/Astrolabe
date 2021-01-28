Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      registrations: 'registrations',
      sessions: :sessions
    }
  
  root 'top#home'
  
  get 'top/menu' => 'top#menu'
  
  get 'top/index' => 'top#index'
  
    # new リスト作成ページを表示する
    # create リストを作成する
    # edit リスト編集ページを表示する
    # update リストを更新する
    # destroy リストを削除する
    resources :list, only: %i(new create edit update destroy) do
      # new カード作成ページを表示する
      # create カードを作成する
      # show カード詳細ページを表示する
      # edit カード編集ページを表示する
      # update カードを更新する
      # destroy カードを削除する
      resources :card, only: %i(new create show edit update destroy)
  end
  
  resources :users, only: [:show]
  
  resources :resume, only: %i(new create show edit update)
  
  # ゲストログイン機能
  devise_scope :user do
    post 'users/guest_sign_in', to: 'sessions#new_guest'
  end
  
end
