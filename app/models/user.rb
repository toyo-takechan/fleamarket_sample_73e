class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #パスワードは7文字以上制限をかける
  validates :nickname, presence: true, uniqueness: true
  validates :password, length: { minimum: 7 }

  has_many :items
  has_one :profile
  has_one :address
  has_one :credit_card

end