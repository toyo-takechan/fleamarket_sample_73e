class Item < ApplicationRecord
  has_many :images
  belongs_to :category
  belongs_to :prefecture
  belongs_to :user

  validates :name, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :condition, presence: true
  validates :postage_payer, presence: true
  validates :postage_type, presence: true
  validates :prefecture_id, presence: true
  validates :preparation, presence: true
  validates :price, presence: true
  validates :seller_id, presence: true

  accepts_nested_attributes_for :images, allow_destroy: true
end
