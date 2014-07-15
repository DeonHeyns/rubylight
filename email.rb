=begin
using System.Net;
using System.Net.Mail;

namespace MailSender
{
    class Program
    {
        static void Main(string[] args)
        {
            var message = new MailMessage(from: "someone@gmail.com", to: "someone2@gmail.com", subject: "This is from C#", body: "This email was sent using .NET");
            var smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.EnableSsl = true;
            smtp.Credentials = new NetworkCredential(userName: "someone@gmail.com", password: "a_password");
            smtp.Send(message);

        }
    }
}
=end

# http://ruby-doc.org/stdlib-2.0/libdoc/net/smtp/rdoc/Net/SMTP.html

require 'net/smtp'

from = someone@gmail.com
to   = someone2@gmail.com

message = <<EOM
From: Someone <#{from}>
To: Someone2 <#{to}>
Subject: This is from Ruby
Date: #{Time.now.strftime("%d/%m/%Y %H:%M")}

This email was sent using Ruby
EOM

smtp = Net::SMTP.new('smtp.gmail.com', 587)
smtp.enable_starttls

smtp.start(Socket.gethostname, '#{from}', 'a_password', :login) do |smtp|
  smtp.send_message(message, '#{from}', '#{to}')
end