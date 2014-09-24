require 'net/http'
require 'json'

include Net

blog_post = { userId: 1,
    title: 'Yo my people',
    body: 'Lorem Ipsum'
}

json = JSON.generate(blog_post)
puts json

uri = URI('http://jsonplaceholder.typicode.com/posts')
req = Net::HTTP::Post.new(uri)
req['Accept'] = 'application/json'

#http = HTTP.new('http://jsonplaceholder.typicode.com')
#post =  http.post('posts', json)

#puts post

resp = Net::HTTP.start(uri.hostname, uri.port) {|http|
  http.request(req)
}

puts resp.body