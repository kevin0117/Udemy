# frozen_string_literal: true

require 'pp'
def parsed_log
  filename = 'data/access_log_20190521-211058.log'

  access_log_lines = File.open(filename, 'r', &:readlines)

  signup_log_lines = access_log_lines.select do |line|
    line.include?('/signup?email=')
  end

  user_data = signup_log_lines.map do |line|
                parsed_array = line.split('" "')
                email = extract_email(parsed_array.first)
                browser = determine_browser(parsed_array.last)
                [email, browser]
              end
end

def determine_browser(user_agent)
  return 'Firefox' if user_agent.include?('Firefox') && user_agent.include?('Gecko')
  return 'Chrome' if user_agent.include?('Chrome')
  return 'Safari' if user_agent.include?('Gecko') && user_agent.include?('Safari')
  'Other'
end

def extract_email(log_line)
  email = log_line.match(/signup\?email\=([a-zA-Z0-9@.]*) HTTP\//)
  email.captures.first
end

p parsed_log

File.open('access_log.json', 'w') do |f|
  f.write parsed_log
end