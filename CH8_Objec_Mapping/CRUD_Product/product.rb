require 'csv'

class Product
  attr_accessor :name, :price, :craft_fee, :weight#, :product_data
  attr_reader :filename

  def initialize(name, price, weight, craft_fee, product_id = rand(1000..9999))
    @name = name
    @price = price
    @weight = weight
    @craft_fee = craft_fee
    @product_id = product_id
    @filename = "Product-#{product_id}-file.csv"
  end
  
  def save
    save_file = CSV.open(filename,'w') do |csv|
                  csv << [name, price, weight, craft_fee]
                end
    puts "File #{filename} saved for the product with ID #{product_id}"
    return !save_file.nil?
  end

  def create
    if !File.exist?(filename)
      save
    else
      puts "Product file already exist"
    end
  end

  def self.read(product_id)
    filename = "Product-#{product_id}-file.csv"
    if File.exists?(filename)
      CSV.open(filename,'r') do |csv|
        data_line = csv.read.flatten
        name = data_line[0]
        price = data_line[1]
        weight = data_line[2]
        craft_fee = data_line[3]
  
        return Product.new(name, price, weight, craft_fee, product_id)
      end
    else
      puts "The #{filename} doesn't exist" 
    end
  end

  def update
    if File.exists?(filename)
      save
    else
      puts "File doesn't exist, update cannot be performed"
      return false
    end
  end

  def self.destroy(product_id)
    filename = "Product-#{product_id}-file.csv"
    if File.exist?(filename)
      File.delete(filename)
      puts "The file was destroyed"
      return true
    else
      "The #{filename} file doesn't exist, destroy cannot be performed" 
      return false
    end
  end
end

