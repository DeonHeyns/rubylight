require 'highline/import'

def password_prompt(message, mask='*')
  ask(message) { |q| q.echo = mask}
end

password = password_prompt('Hey dude choose a password: ')

puts "Your password is '#{password}'"