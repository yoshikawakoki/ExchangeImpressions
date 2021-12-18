class PostHashtagRelation < ApplicationRecord
  belongs_to :post_comments
  belongs_to :hashtag
  with_options presence: true do
    validates :post_id
    validates :hashtag_id
  end
end
