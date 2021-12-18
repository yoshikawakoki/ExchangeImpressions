class Hashtag < ApplicationRecord
  validates :hashname, presence: ture, length: { maximum:99}
  hasmany :post_hashtag_relations
  hasmany :posts, through: :post_hashtag_relations
end
