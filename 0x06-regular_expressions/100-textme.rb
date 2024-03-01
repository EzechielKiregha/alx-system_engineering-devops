#!/usr/bin/env ruby

if ARGV.length != 1
  puts "Usage: #{$PROGRAM_NAME} <log_file>"
  exit 1
end

# Let's extract the required information using regular expression
match_data = ARGV[0].match(/\[from:([^\]]+)\] \[to:([^\]]+)\] \[flags:([^\]]+)\]/)
if match_data
  sender = match_data[1]
  receiver = match_data[2]
  flags = match_data[3]
  puts "#{sender},#{receiver},#{flags}"
end
