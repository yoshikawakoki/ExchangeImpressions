class PostHashtagRelation < ApplicationRecord
  belongs_to :hashtag
  belongs_to :post
  with_options presence: true do
    validates :post_id
    validates :hashtag_id
  end
end
