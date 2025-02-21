# frozen_string_literal: true

require 'httparty'
require 'nokogiri'
require 'pp'

def convert_price(price)
  #------------------Instructor Version----------------
  price.gsub('$','').gsub(',','').to_i

  #------------------My Version------------------------
  # i = 0
  # result = []
  # while i < price.length
  #   if price[i].to_i != 0
  #     result << price[i].to_i
  #   end
  #   i += 1
  # end
  # result.join.to_i
end
# p convert_price("$32,899")
def car_shopper
  car_info_list = []
  response = HTTParty.get('https://code.evgenyrahman.com/rubycourse/carlist.html')
  parsed_html = Nokogiri::HTML(response.body)

  car_listings = parsed_html.css('.card.car')

  #-------------------------------My Version-----------------------------------
  #   car_listings.each do |each_car|
  #     car_name = each_car.css('.make').text
  #     car_year = each_car.css('.year').text
  #     car_rating = each_car.css('.rating').attribute("data-rating").value
  #     car_price = each_car.css('.price').text
  #
  #     car_info_list.push({name: car_name, year: car_year, rating: car_rating, price: car_price})
  #   end
  #
  #------------------------------Instructor Version-----------------------
  cars = car_listings.map do |each_car|
    {
      name: each_car.css('.make').text,
      year: each_car.css('.year').text.to_i,
      price: convert_price(each_car.css('.price').text),
      rating: each_car.css('.star.rating').attribute('data-rating').value.to_i
    }
  end

  cars.select! do |car|
    (car[:price] < 30000) && (car[:year] > 2014) && (car[:rating] > 3)
  end

  File.open('car_listings.json', 'wb') do |f|
    f << cars.to_json # '<' is append, '<<' is overwrite
  end
  puts 'Results were written to file!'
  # pp cars
  #   pp car_listings.first
  #   puts "-------------------------------------------------"
  #   puts car_listings.first
  #   puts "Welcome to the car shopper"

  #   puts response.body
  #   puts parsed_html
end

car_shopper
