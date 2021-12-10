Rails.application.routes.draw do
  #ユーザー
  devise_for :users
  
  #トップページ
  root to: "homes#top"
  
  #ユーザー
  resources :users, only: [:index, :show, :edit, :update] do
    #フォロー、フォロワー
    resources :relationships, only: [:create, :destroy]
    #フォロー一覧
    get "followings" => "relationships#followings", as: "followings"
    #フォロワー一覧
    get "followers" => "relationships#followers", as: "followers"
  end
  
  #投稿
  resources :posts do
    #コメント
    resources :post_comments, only: [:create]
    #いいね
    resources :favorites, only: [:create, :destroy]
  end
  
  #ジャンル
  resources :genres, only: [:index, :create, :edit, :update, :destroy]
  
end
