class Item < ApplicationRecord
  has_many :images
  belongs_to :category
  belongs_to :user
  belongs_to :prefecture
end
