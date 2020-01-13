class Comment < ApplicationRecord
  validates :movie_id, uniqueness: { scope: :author, message: "You've reviewed this movie!" }
  belongs_to :movie, required: false
end
