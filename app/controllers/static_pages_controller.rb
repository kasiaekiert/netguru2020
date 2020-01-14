class StaticPagesController < ApplicationController
  def topcommentators
    @topcommentators = Comment.where('created_at >= ?', 1.week.ago.utc).group("author").count.sort_by {|k, v| [-v, k ]}[0..9]
  end
end
