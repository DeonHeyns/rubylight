require 'benchmark'

class Primer
  def self.is_prime_number(x)
    return true if x == 2 || x == 3 || x == 5  || x == 7
    return false if divisible_by_two(x)
    return false if divisible_by_three(x)
    return false if divisible_by_five(x)
    return false if divisible_by_seven(x)
    return true
  end

  private

  def self.divisible_by_two(x)
    return x % 2 == 0
  end

  def self.divisible_by_three(x)
    return x % 3 == 0
  end

  def self.divisible_by_five(x)
    return x % 5 == 0
  end

  def self.divisible_by_seven(x)
    return x % 7 == 0
  end
end


iterations = 1000000



Benchmark.bm(3) do |b|
  b.report('for loop') { for i in 1..iterations; y = 1; end }
  b.report('times   ') { iterations.times do; y = 1; end }
  b.report('upto    ') { 1.upto iterations do; y = 1; end}
end

def some_service_call
  1.upto 1000000 do
  end
end

Benchmark.bm(23) do |b|
  b.report('call to some_service_call') { some_service_call }
end

Benchmark.bm(23) do |b|
  b.report('is prime number over 100000 executions') do
    (1..1000000).each { |i|
      Primer.is_prime_number i
    }
  end
end


