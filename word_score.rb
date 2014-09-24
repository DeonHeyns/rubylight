
module Scorer
  class WordScore

    def initialize
      @letters = Hash.new(0).merge( { 'f' => 3, 'j' => 6, 'x' => 12, 'a' => 2, 'i' =>2, 'e'=>2, 'o' =>2, 't' => 5} )
    end

    def word_score(word)
      word.downcase!
      score = 0
      word.split('').each do |letter|
        score += @letters[letter]
      end
      score
    end
  end
end


counter = Scorer::WordScore.new
puts "The score is #{counter.word_score('XRay Machine')}"
puts "The score is #{counter.word_score('Jabbt')}"