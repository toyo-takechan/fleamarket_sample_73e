class Address < ApplicationRecord
  
  belongs_to :user
  belongs_to :prefecture
  
  #郵便番号は7ケタ限定にする
  validates :post_code, length: { is: 7 }
end
