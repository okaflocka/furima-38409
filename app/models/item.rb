class Item < ApplicationRecord
  
  validates :image, :title, :content, presence: true
  validates :category_id, :condition_id, :shipping_fee_id, :shipping_days_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_area_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :price, presence: true, numericality: { only_integer: true }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :shipping_days

end
