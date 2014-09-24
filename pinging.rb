require 'net/ping'

ping = Net::Ping::External.new('127.0.0.1')
puts ping.ping? # returns true if successful

# Ping usually times out after 5 seconds lets increase that to 15
ping = Net::Ping::External.new('127.0.0.1', nil, 15)
puts ping.ping? # returns true if successful

# Ping port 8080 for 5 seconds
ping = Net::Ping::External.new('127.0.0.1', 8080, 5)
puts ping.ping? # returns true if successful