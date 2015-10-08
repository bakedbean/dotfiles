require 'rubygems'
require 'wirble'
require 'irb/ext/save-history'

Wirble.init
Wirble.colorize

IRB.conf[:SAVE_HISTORY] = 1000

EMAIL = 'eben.goodman@gmail.com'

def scp_user(email='')
  if email.blank?
    email = EMAIL
  end

  Patient.where(email: email).first
end

def scp_import(type)
  if type == "integration"
    Legacy::Integration.new
  else
    Legacy::Import.new
  end
end
