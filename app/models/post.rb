class Post < ApplicationRecord
  has_many :post_hashtag_relations
  has_many :hashtags, through: :post_hashtag_relations
  
  
  #DBへのコミット直前に実施する
  after_create do
    post = Post.find_by(id: self.id)
    #先頭に#のつく入力値を探し抽出する
    hashtags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    post.hashtags = []
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
    post.hashtags.clear
    hashtags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: tashtag.downcase.delete('#'))
      post.hashtags << tag
    end
  end
end
