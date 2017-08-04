=begin


require 'mail'

Mail.defaults do
  delivery_method :smtp, {
                           :address              => 'mail.stp.mrll.com',
                           :port                 => 25,
                           :domain               => 'adminsys',
                           #:user_name            => 'jaganmohan.thirupathy@merrillcorp.com',
                           #:password             => 'Datasite123',
                           # :authentication       => :login,
                           #:authentication       => 'plain',
                            :enable_starttls_auto => false
                           }

  retriever_method :pop3, { :address    => 'webmail.merrillcorp.com',
                          :port       => 465,
                          :user_name  => 'jaganmohan.thirupathy@merrillcorp.com',
                          :password   => 'Datasite123',
                          :enable_ssl => true    }
end


Mail.deliver do
  to '109115@merrillcorp.com'
  from '109115@merrillcorp.com'
  subject 'testing sendmail'
  body 'testing sendmail'
end
=end


