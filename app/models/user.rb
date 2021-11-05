class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name,               presence: true
         validates :email,              presence: true, unique: true
         validates :encrypted_password, presence: true
         validates :birthday,           presence: true
         validates :first_name,         presence: true
         validates :family_name,        presence: true
         validates :first_name_rub,     presence: true
         validates :family_name_rub,    presence: true
end
