# frozen_string_literal: true

require 'csv'
require 'pp'

def get_files
  matching_files = Dir['data/access_log_*-*.log']
  parsing_result = matching_files.map do |file|
    access_log_lines = File.open(file, 'r', &:readlines)
    parsed_log(access_log_lines)
  end
end

def parsed_log(log_lines)
  cross_reference_data = []
  signup_log_lines = log_lines.select { |line| line.include?('signup') }

  signup_log_lines.each do |line|
    browser = determine_browser(line)
    email = extract_email(line)
    full_name = cross_reference(email)
    cross_reference_data.push(full_name.merge(email: email, browser: browser))
  end

  cross_reference_data
end

def determine_browser(line)
  return 'Chrome' if line.include?('Chrome')
  return 'Firefox' if line.include?('Firefox')
  return 'Safari' if line.include?('Safari') && line.include?('Gecko')

  'Other'
end

def extract_email(line)
  line.match(/signup\?email\=([a-zA-Z0-9@.]*) HTTP/).captures.first
end

def cross_reference(email)
  users_lines = CSV.open('data/users.csv', 'r', &:readlines)

  users_lines.each do |line|
    if line[0] == email
      line[0] = 'Unknown'
      line[1] = 'Unknown'
      line[2] = email
    end
    line[0] = 'Unknown' if line[0].nil?
    line[1] = 'Unknown' if line[1].nil?
  end

  users_lines.each do |line|
    return { first_name: line[1], last_name: line[0] } if line.include?(email)
  end
end

pp get_files

File.open('access_log.json', 'w') do |f|
  f.write get_files
end
