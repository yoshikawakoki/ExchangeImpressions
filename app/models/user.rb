class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :post_comments
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  attachment :profile_image

  #フォローした時
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  #フォローを外すとき
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  #フォローしているか確認
  def following?(user)
    followings.include?(user)
  end

end
