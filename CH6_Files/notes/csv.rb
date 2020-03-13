require 'csv'

# csv_from_file = CSV.read('data.csv')

# # p csv_from_file.first.first

# csv_string = "goldbar, coin, platinum, sliver"

# parsed_string = CSV.parse(csv_string).flatten

# p parsed_string.first

# gold_features = ['purity', 'size', 'weight', 'price', 'date']

# CSV.open('data.csv','a') do |csv|
#   csv << gold_features
# end

# # using csv convert to string
# gold_features_string = CSV.generate do |csv|
#   csv << gold_features
# end

# p gold_features_string
# output: "purity,size,weight,price,date\n"

puts "Please enter the file name"

file_name = gets.chomp

if File.exists?(file_name)
  f = File.open(file_name,'r')
  puts f.read
  f.close
else
  puts "file doesn't exist"
end

