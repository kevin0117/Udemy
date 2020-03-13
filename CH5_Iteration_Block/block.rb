
# p (1..100).select {|n| n.odd?}

# def my_select(list)
#     i = 0
#   while i < list.length do
#     if list[i] % 2 == 1
#       puts list[i]
#     end
#     i += 1
#   end   
# end

# def my_select(list)
#   result = []
#   i = 0
#   while i < list.length do
#     result << list[i] if yield(list[i])
#     i += 1
#   end  
#   result 
# end

def my_select(list)
  result = []
  list.each do |n|
    result << n if yield(n)
  end
  result
end

p my_select([1, 2, 3, 4, 5]) { |i| i.odd? }