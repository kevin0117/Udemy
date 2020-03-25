require 'pp'
filename = 'data/access_log_20190521-211058.log'

access_log_lines = File.open(filename, 'r') do |f|
  f.readlines
end

signup_log_lines = access_log_lines.select do |line|
                     line.include?('/signup?email=')
                   end

# puts signup_log_lines

File.open('access_log.json','w') do |f|
  f.write signup_log_lines
end
