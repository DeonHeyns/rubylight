require 'net/smtp'

addresses = File.read('addresses.csv').split(',').map(&:strip)

from = 'heynsd@gmail.com'
password = 'a_password'

message = <<EOM
From: Someone <#{from}>
To: Someone2 <%{to}>
Subject: This is from Ruby
Date: #{Time.now.strftime("%d/%m/%Y %H:%M")}

This email was sent using Ruby
EOM

smtp = Net::SMTP.new('smtp.gmail.com', 587)
smtp.enable_starttls

smtp.start(Socket.gethostname, "#{from}", "#{password}", :login) do |smtp|
	addresses.each do |to|	
		begin
			smtp.send_message(message % {to: to}, "#{from}", "#{to}")
		rescue Exception => e
			puts e
		end
	end
end