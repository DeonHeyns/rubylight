require 'action_mailer'

ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   :address   => "smtp.gmail.com",
   :port      => 587,
   :authentication => :login,
   :user_name      => "heynsd@gmail.com",
   :password       => "password",
   :enable_starttls_auto => true
  }


class Mailer < ActionMailer::Base

  def awesome_email(details)
		
		@to = details[:to]
    @from = details[:from]
    subject = details[:subject]

    mail(   :to      => "#{@to}",
            :from    => "#{@from}",
            :subject => subject) do |format|
                format.html
    end
  end
end

# This is a Hash that will be passed to the awesome_email method
details = { to: 'deon@deonheyns.com' , from: 'heyns@gmail.com', subject: 'Welcome to awesome!' }

ActionMailer::Base.view_paths = File.dirname(__FILE__)

email = Mailer.awesome_email( details )
puts email
email.deliver