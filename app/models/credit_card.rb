class CreditCard < ApplicationRecord

  belongs_to :user

  require 'payjp'
  
  
end
