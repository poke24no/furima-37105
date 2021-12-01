class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :name,                presence: true
  validates :password,            format: { with: VALID_PASSWORD_REGEX }
  validates :birthday,            presence: true
  validates :first_name,         { presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ } }
  validates :family_name,        { presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ } }
  validates :first_name_rub,     { presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } }
  validates :family_name_rub,    { presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } }

  has_many :items
  has_many :buyers
  has_many :comments
end
