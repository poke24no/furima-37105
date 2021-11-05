class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
         validates :name,               presence: true
         validates :email,              presence: true
         validates :password,           {presence: true, format: { with: VALID_PASSWORD_REGEX },length:{minimum:7}}
         validates :birthday,           presence: true
         validates :first_name,         presence: true
         validates :family_name,        presence: true
         validates :first_name_rub,     presence: true
         validates :family_name_rub,    presence: true
end
