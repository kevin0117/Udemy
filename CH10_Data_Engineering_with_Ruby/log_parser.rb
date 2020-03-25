# frozen_string_literal: true

require 'pp'
def parsed_log
  filename = 'data/access_log_20190521-211058.log'

  access_log_lines = File.open(filename, 'r', &:readlines)

  signup_log_lines = access_log_lines.select do |line|
    line.include?('/signup?email=')
  end

  user_data = signup_log_lines.map do |line|
    parsed_line = line.split('" "').last
    determine_browser(parsed_line)
  end

  puts user_data
  File.open('access_log.json', 'w') do |f|
    f.write user_data
    #   f.write signup_log_lines
  end
end

def determine_browser(user_agent)
  return 'Firefox' if user_agent.include?('Firefox') && user_agent.include?('Gecko')
  return 'Chrome' if user_agent.include?('Chrome')
  return 'Safari' if user_agent.include?('Gecko') && user_agent.include?('Safari')
  'Other'
end

parsed_log