class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :day

  validates :title,         presence: true
  validates :information,   presence: true
  validates :image,         presence: true
  validates :category_id,   presence: true
  validates :status_id,     presence: true
  validates :fee_id,        presence: true
  validates :prefecture_id, presence: true
  validates :day_id,        presence: true
  validates :price,         presence: true
  validates_inclusion_of :price, in: 300..9_999_999
  validates :price, format: { with: /\A[0-9]+\z/ }

  validates :category_id,   numericality: { other_than: 1 } 
  validates :status_id,     numericality: { other_than: 1 } 
  validates :fee_id,        numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :day_id,        numericality: { other_than: 1 } 
  validates :price,         numericality: true

  belongs_to :user
  has_one :purchase
  has_one_attached :image
end
