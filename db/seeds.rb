require 'faker'

puts 'Cleaning database...'
Movie.destroy_all
List.destroy_all
Bookmark.destroy_all

100.times do
  movie = Movie.create(
    title: Faker::Movie.title,
    overview: Faker::Movie.quote,
    poster_url: Faker::LoremPixel.image,
    rating: rand(1..5)
  )
  puts "Created #{movie.title}"
end

puts '------------------------'
puts 'Finished seeding'
