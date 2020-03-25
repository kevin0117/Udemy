require 'pp'
filename = 'data/access_log_20190521-211058.log'

access_log_lines = File.open(filename, 'r') do |f|
  f.readlines
end

signup_log_lines = access_log_lines.select do |line|
                     line.include?('/signup?email=')
                   end

user_data = signup_log_lines.map do |line|
              parsed_line = line.split('" "').last
            end 

puts user_data
File.open('access_log.json','w') do |f|
  f.write user_data
#   f.write signup_log_lines
end
