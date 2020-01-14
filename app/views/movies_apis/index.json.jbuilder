json.array! @moviesapis do |movie_api|
  json.id movie_api.id
  json.name movie_api.title
  if params['details']
    json.genre do
      json.id movie_api.genre.id
      json.name movie_api.genre.name
      json.genre_movies movie_api.genre.movies.count
    end
  end
end

# http://localhost:3000/movies_apis.json First version
# http://localhost:3000/movies_apis.json?details=1    Second Version of API