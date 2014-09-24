def awesome_happened
  puts 'Awesome'
end

proc = Proc.new { awesome_happened }
proc.call


10.times(&proc)


def database_call(&block)
  # do something cool and callback
  block.call if block_given?
end


database_call(&proc)


database_call do
  puts 'jello'
end