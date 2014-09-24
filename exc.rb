url = 'http://api.someapi.com/magic'

tries = 0

begin
	tries += 1
  resp = Net::HTTP.get_response(URI.parse(url))
rescue 
	puts 'An error occurred'
	retry unless tries > 3
end
data = resp.body unless resp.nil?