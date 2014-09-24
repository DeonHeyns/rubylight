require 'profile'

def add(lhs, rhs)
  lhs + rhs
end

amount = 0
(1...1000).each do |num|
  amount += add(amount, num)
end

puts amount