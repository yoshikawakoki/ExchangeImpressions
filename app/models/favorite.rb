class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  #一回しかいいねを押せないようにバリデーションを
  validates_uniqueness_of :post_id, scope: :user_id
end
