class Item < ApplicationRecord
  has_many :images
  belongs_to :categories
  belongs_to :prefecture
  belongs_to :user
end
