class Relationship < ApplicationRecord
  #フォローしたuser.idを持ってくる
  belongs_to :follower, class_name: "User"
  #フォローされたuser.idを持ってくる
  belongs_to :followed, class_name: "User"
end
