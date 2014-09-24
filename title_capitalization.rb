require 'minitest/autorun'
#require 'minitest/reporters'

#Minitest::Reporters.use!

class TitleCapitalization < Minitest::Test

  def setup
    @title1 = 'i love solving problems and it is fun'
    @title2 = 'Why Does A biRd Fly?'
    @title3 = 'at the swimming pool diving in'
    @title_exceptions = %w(a the to at in with and but or)
  end

  def test_always_capitalize_the_first_word_in_a_title
    result = title_case(@title1)
    assert_equal 'I', result.split(' ').first

    result = title_case(@title2)
    assert_equal 'Why', result.split(' ').first

    result = title_case(@title3)
    assert_equal 'At', result.split(' ').first
  end

  def test_always_capitalize_the_last_word_in_a_title
    result = title_case(@title1)
    assert_equal 'Fun', result.split(' ').last

    result = title_case(@title2)
    assert_equal 'Fly?', result.split(' ').last

    result = title_case(@title3)
    assert_equal 'In', result.split(' ').last
  end

  def test_lowercase_a_the_to_at_in_with_and_but_or
    result = title_case('First a the to at in with and but or Last')
    assert_equal result, 'First a the to at in with and but or Last'
  end

  def test_a
    title = 'A new journey - database migrations converting c# to Ruby'
    puts title_case title
  end

  private
    def title_case(title)
      title_case = []

      title.downcase!
      words = title.split(' ')

      words.each_with_index do |word, index|

        if index == 0 || index == words.length - 1 || !@title_exceptions.include?(word)
            title_case << capitalize(word) # Ruby has the capitalize method but I want to do this the hard way
        else
          title_case << word
        end

      end

      title_case.join(' ')
    end

    def capitalize(word)
      word = word.split('')
      word[0].upcase!
      word.join
    end
end