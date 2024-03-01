#!/usr/bin/env ruby

# difine a match
regex = /School/
# get the first argument
argument = ARGV[0]

# Check if the argument matches the regular expression
match_data = argument.match(regex)
if match_data
   puts match_data[0]
else
    puts ""
end
