# frozen_string_literal: true
require 'csv'
require 'pp'

def get_files
#           filename = 'data/access_log_20190521-211058.log'
  matching_files = Dir["data/access_log_*-*.log"]

  parsing_results = matching_files.map do |file|
                      #  access_log_lines = File.open(filename, 'r', &:readlines)
                      #  上面寫法等同於下面
                      access_log_lines = File.open(file, 'r') do |f|
                        f.readlines
                      end
                      parsed_log(access_log_lines)
                    end
  pp parsing_results
end

def parsed_log(log_lines)

  signup_log_lines = log_lines.select do |line|
    line.include?('/signup?email=')
  end

  user_data = signup_log_lines.map do |line|
                parsed_array = line.split('" "')
                email = extract_email(parsed_array.first)
                browser = determine_browser(parsed_array.last)
                [email, browser]
              end
  cross_reference_data = user_data.map do |line|
                           cross_reference(line)
                         end
  cross_reference_data
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
  matching_users = users.select do |line|
                     log_line[0] == line[2]
                   end

  matching_user = matching_users.first
  { first_name: matching_user[1],
    last_name: matching_user[0],
    email: matching_user[2],
    browser: log_line[1]
  }
end

get_files

File.open('access_log.json', 'w') do |f|
  f.write get_files
end