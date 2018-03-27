# encoding: utf-8

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@wiki-clone-app.com'
  layout 'mailer'
end
