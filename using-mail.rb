require 'erb'
require 'mail'

class Mailer
  
  def initialize(options)
    Mail.defaults do 
      delivery_method :smtp, options
    end
  end
  
  def awesome_email(details)
    @to           = details[:to]
    @from         = details[:from]
    subject       = details[:subject]
    template_path = details[:template_path]
    
    # Not doing this will mean your template wont use your instance level variables
    b = binding
    
    mail = Mail.new
    mail.to = @to
    mail.from = @from
    mail.subject = subject
    mail.body = ERB.new(File.read(template_path)).result(b)
    
    mail.deliver!
  end
end

# Needed my Mail to send our email
options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :user_name            => 'heyns@gmail.com',
            :password             => 'password',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

mailer = Mailer.new(options)

# This is a Hash that will be passed to the awesome_email method
details = { to: 'deon@deonheyns.com',
            from: 'heyns@gmail.com',
            subject: 'Welcome to awesome!',
            template_path: 'mailer/awesome_email.html.erb' }


mailer.awesome_email(details)