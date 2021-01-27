class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :day

  with_options presence: true do
    validates :title
    validates :information
    validates :image
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :prefecture_id
    validates :day_id
    validates :price
  end
  validates_inclusion_of :price, in: 300..9_999_999

  with_options numericality: { other_than: 1 }  do
   validates :category_id
   validates :status_id
   validates :fee_id
   validates :prefecture_id
   validates :day_id
  end
  validates :price,         numericality: { with: /\A[0-9]+\z/ }

  belongs_to :user
  has_one :purchase
  has_one_attached :image
end
