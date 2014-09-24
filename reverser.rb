incorrect = '.sdaer ecnetnes siht yaw eht si sihT'
correct = ''
i = 1

begin
  correct += incorrect[incorrect.length - i]
  i += 1
end while incorrect.length >= i

puts correct


puts incorrect.reverse


incorrect = 'reads. sentence this way the is This'
correct = incorrect.split(' ')
                   .reverse()
                   .join(' ')
puts correct