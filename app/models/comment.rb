class Comment < ApplicationRecord
  validates :movie_id, uniqueness: { scope: :author, message: "You've reviewed this movie!" }
  validates :user_id, :uniqueness => { :scope => :movie_id,
    :message => "Users may only write one review per movie." }
  
  belongs_to :movie, required: false
  belongs_to :user
end
