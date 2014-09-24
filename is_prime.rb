require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class IsPrime < Minitest::Test

  def test_number_is_2
    assert_equal Primer.is_prime_number(2), true
  end

  def test_number_is_3
    assert_equal Primer.is_prime_number(3), true
  end

  def test_number_is_5
    assert_equal Primer.is_prime_number(5), true
  end

  def test_number_is_7
    assert_equal Primer.is_prime_number(7), true
  end

  def test_11_is_prime
    assert_equal Primer.is_prime_number(11), true
  end

  def test_13_is_prime
    assert_equal Primer.is_prime_number(13), true
  end

  def test_17_is_prime
    assert_equal Primer.is_prime_number(17), true
  end

  def test_19_is_prime
    assert_equal Primer.is_prime_number(19), true
  end

  def test_4_is_not_prime
    assert_equal Primer.is_prime_number(4), false
  end

  def test_6_is_not_prime
    assert_equal Primer.is_prime_number(6), false
  end

  def test_8_is_not_prime
    assert_equal Primer.is_prime_number(8), false
  end

  def test_9_is_not_prime
    assert_equal Primer.is_prime_number(9), false
  end

  def test_10_is_not_prime
    assert_equal Primer.is_prime_number(10), false
  end

  def test_20_is_not_prime
    assert_equal Primer.is_prime_number(20), false
  end
end

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