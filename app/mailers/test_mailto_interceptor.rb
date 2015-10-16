class TestMailtoInterceptor
  def self.delivering_email(mail)
    mail.to = [ 'tester@wings.msn.to' ]
  end
end
