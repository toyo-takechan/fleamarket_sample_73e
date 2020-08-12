class Profile < ApplicationRecord
  belongs_to :user, optional: true
  
  validates :birth_year,               presence: true
  validates :birth_month,              presence: true
  validates :birth_day,                presence: true
  validates :family_name,             presence: true
  validates :first_name,              presence: true
  validates :family_name_kana,        presence: true
  validates :first_name_kana,         presence: true
end
