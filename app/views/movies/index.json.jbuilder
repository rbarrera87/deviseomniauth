json.array!(@movies) do |movie|
  json.extract! movie, :name, :sinopsis
  json.url movie_url(movie, format: :json)
end
