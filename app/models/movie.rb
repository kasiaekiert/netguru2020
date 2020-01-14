# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  released_at :datetime
#  avatar      :string
#  genre_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Movie < ApplicationRecord
  belongs_to :genre
  has_many :comments

  def cover
    'https://pairguru-api.herokuapp.com' + download_info["poster"]
  end

  def download_info
    return @api_info if @api_info
    url = 'https://pairguru-api.herokuapp.com/api/v1/movies/' + URI.escape(self.title)

    response = Faraday.get(url) do |req|
      req.headers['Content-Type'] = 'application/json'
    end
    @api_info = JSON.parse(response.body).dig("data", "attributes")
  end 
end