require 'httparty'
require 'nokogiri'
require 'pp'

def car_shopper
  car_info_list=[]
  response = HTTParty.get('https://code.evgenyrahman.com/rubycourse/carlist.html')
  parsed_html = Nokogiri::HTML(response.body)

  car_listings = parsed_html.css('.card.car')

  car_listings.each do |each_car|
    car_name = each_car.css('.make').text
    car_year = each_car.css('.year').text
    car_rating = each_car.css('.rating').attribute("data-rating").value
    car_price = each_car.css('.price').text

    car_info_list.push({name: car_name, year: car_year, rating: car_rating, price: car_price})
  end

  puts car_info_list

#   pp car_listings.first
#   puts "-------------------------------------------------"
#   puts car_listings.first
#   puts "Welcome to the car shopper"

#   puts response.body
#   puts parsed_html
end

car_shopper