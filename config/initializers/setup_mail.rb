ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => "587",
  :domain => "r-es.org",
  :user_name => "rhelpes",
  :password => "polloconpatatas",
  :authentication => "plain",
  :enable_starttls_auto => true
}