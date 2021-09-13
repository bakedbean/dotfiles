require "amazing_print"
AmazingPrint.irb!

def merchant(id)
  m = Merchant.where(public_key: /#{id}/i).first
  m ||= Merchant.where(name: /#{id}/i).first
  m
end

def user(id)
  user = User.where(email: /#{id}/i).first
  user ||= User.where(last_name: /#{id}/i).first
  user
end

def company(id)
  c = Company.where(id: id).first
  c ||= Company.where(name: /#{id}/i).first
  c
end
