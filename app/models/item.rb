class Item < ApplicationRecord
  has_many :images
  belongs_to :category
  belongs_to :prefecture
  belongs_to :user
end
