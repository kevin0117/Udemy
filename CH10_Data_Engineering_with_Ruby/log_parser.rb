# frozen_string_literal: true
require 'csv'
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

def cross_reference(log_line)
  users = CSV.open('data/users.csv') do |csv|
    csv.readlines
  end
  users.map! do |line|
    if line.length == 3
      if line[0].nil?
        line[0] = 'Unknown'
      end

      if line[1].nil?
        line[1] = 'Unknown'
      end
    else
      if line[0].match(/[a-zA-Z0-9@.]*/)
        email = line[0]
        line[0] = "Unknown"
        line.push("Unknown")
        line.push(email)
      end
    end
    line
  end
  users
end

p cross_reference("")
# p parsed_log

File.open('access_log.json', 'w') do |f|
  f.write cross_reference("")
end