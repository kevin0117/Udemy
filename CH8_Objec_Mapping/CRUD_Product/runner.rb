require_relative 'product'

# product = Product.new("ring","5500","1.32","880","7949")

# product.create

p product = Product.read(7949)

product.name = 'necklace'

product.update

# Product.destroy(7949)