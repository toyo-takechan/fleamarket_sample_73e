class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #パスワードは7文字以上制限をかける
  validates :nickname, presence: true
  validates :password, presence: true,length: { minimum: 7 }
  validates :email, presence: true

  has_many :items
  has_one :credit_card

  has_one :profile
  has_one :address
  accepts_nested_attributes_for :profile, allow_destroy: true
  accepts_nested_attributes_for :address, allow_destroy: true

end
