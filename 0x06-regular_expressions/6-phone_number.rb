#!/usr/bin/env ruby

# puts ARGV[0].scan(/^\d{10,10}$/).join
puts ARGV[0] =~ /^\d{10}$/ ? ARGV[0].strip : ""

