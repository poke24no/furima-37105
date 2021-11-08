class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :day
  belongs_to :load
  belongs_to :prefecture
  belongs_to :status
  has_many :users
  
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :day_id, numericality: { other_than: 1 } 
  validates :load_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
end
