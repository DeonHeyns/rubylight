
shopping_list = ''
open('shopping.txt') do |f|
  shopping_list = f.read
end
puts shopping_list.class
puts shopping_list

shopping_list = []
open('shopping.txt') do |f|
  shopping_list = f.readlines
end
puts shopping_list.class
puts shopping_list


