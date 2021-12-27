class Post < ApplicationRecord
  belongs_to :user
  has_many :users, through: :favorites
  has_many :favorites, dependent: :destroy
  has_many :post_hashtag_relations
  has_many :hashtags, through: :post_hashtag_relations
  has_many :post_images, dependent: :destroy
  has_many :post_comments
  accepts_attachments_for :post_images, attachment: :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  #DBへのコミット直前に実施する
  after_create do
    post = Post.find_by(id: id)
    #先頭に#のつく入力値を探し抽出する
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー０-９]+/)
    #mapで繰り返すことで複数のハッシュタグの保存をする
    hashtags.uniq.map do |hashtag|
      #作成しようとしているハッシュタグがすでに存在しているかを確認、なければ作成
      #ハッシュタグは先頭の#を外して保存
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      # <<は一つの投稿に対し複数のハッシュタグを1回で保存するために使っている。配列として追加するメソッド
      post.hashtags << tag
    end
  end

  before_update do
    post = Post.find_by(id: id)
    #更新時にハッシュタグを一度消す
    #test1 #test2 => #sample1 #sample2 #sample2
    post.hashtags.clear
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: tashtag.downcase.delete('#'))
      post.hashtags << tag
    end
  end
end
