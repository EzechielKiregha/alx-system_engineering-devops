#!/usr/bin/env ruby

# now I will read the log file line by line
File.foreach('log_file.txt') do |line|
  # Let's extract the required information using regular expression
  match_data = line.match(/\[from:([^\]]+)\] \[to:([^\]]+)\] \[flags:([^\]]+)\]/)
  if match_data
    sender = match_data[1]
    receiver = match_data[2]
    flags = match_data[3]
    puts "#{sender},#{receiver},#{flags}"
  end
end
