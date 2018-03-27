# encoding: utf-8

Devise.setup do |config|
  config.mailer_sender = 'no-reply@blogapp-app.com'
  config.secret_key = '44d6d0a16ecd018c19e57d4d810a71e9c0ff09703de9a14b6d49e84f394d7bc76cb46ff72c85467ca9619f27eb87c181fcdeaafecce969a20db72408e1d3a72d'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:login]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = false
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
