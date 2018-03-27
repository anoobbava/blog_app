# encoding: utf-8

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@blog-app-bava.herokuapp.com'
  layout 'mailer'
end
