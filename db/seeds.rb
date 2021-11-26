
require 'json'
require 'open-uri'
puts "destroying movies"

Movie.destroy_all

puts "Creating movies"

url = 'http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>'
response = URI.open(url).read
results = JSON.parse(response)["results"].first(10)

results.each do |result|
  movie = Movie.new(
    title: result[:title]
  )
  movie.save!
end

puts "Movies created!"
