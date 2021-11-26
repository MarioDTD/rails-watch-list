
require 'json'
require 'open-uri'
puts "destroying movies"

# Movie.destroy_all

puts "Creating movies"

url = 'http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>'
response = URI.open(url).read
results = JSON.parse(response)["results"].first(10)

results.each do |result|
  movie = Movie.new(
    title: result["title"],
    overview: result["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{result["poster_path"]}"
  )
  movie.save!
end

puts "Movies created!"
