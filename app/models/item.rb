class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :day
  belongs_to :load
  belongs_to :prefecture
  belongs_to :status
  belongs_to :user
  has_one    :buyer
  has_many   :comments

  validates :item_name,      presence: true
  validates :image,          presence: true
  validates :explanation,    presence: true
  validates :price,          { presence: true, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9_999_999 } }
  validates :category_id,    numericality: { other_than: 1 }
  validates :day_id,         numericality: { other_than: 1 }
  validates :load_id,        numericality: { other_than: 1 }
  validates :prefecture_id,  numericality: { other_than: 1 }
  validates :status_id,      numericality: { other_than: 1 }
end
