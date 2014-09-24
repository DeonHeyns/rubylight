class Library
  attr_accessor :games
  all = [:each, :map, :select]
  all.each do |m|
    define_method m do |&b|
      self.games.send m, &b
    end
  end
end

l = Library.new
l.games = ['a', 'b', 'c']

l.each do |a|
  puts a
end