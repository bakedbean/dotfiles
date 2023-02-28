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

module Audit
  @find = -> (needle, haystack) {
    haystack.history_tracks.each { |h|
      return h.modified[needle] if h.modified[needle] && !h.modified[needle].blank?
    }
  }

  def self.search(needle, haystack)
    haystack.is_a?(Array) ? haystack.map { |h| @find.call(needle, h) } : @find.call(needle, haystack)
  end
end
