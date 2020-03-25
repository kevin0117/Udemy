filename = 'data/access_log_20190521-211058.log'

access_log = File.open(filename, 'r') do |f|
  f.readline
end

# puts access_log.length

puts access_log

