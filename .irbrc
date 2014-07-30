require 'rubygems'
require 'wirble'
Wirble.init
Wirble.colorize

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
