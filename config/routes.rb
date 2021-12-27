Rails.application.routes.draw do
  #ユーザー
  devise_for :users

  #トップページ
  root to: "homes#top"

  #ユーザー
  resources :users, only: [:index, :show, :edit, :update] do
    #フォロー、フォロワー
    resource :relationships, only: [:create, :destroy]
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
    resource :favorites, only: [:create, :destroy]
  end

  #ハッシュタグ
  get '/post/hashtag/:name', to: "posts#hashtag"
end
