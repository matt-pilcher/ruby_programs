require 'rest-client'


puts "Enter a search query"
input = gets.chomp
result = RestClient.get 'http://www.google.com/#q=' << "#{input}"
puts result.to_s
puts "This is the source of your search result"
