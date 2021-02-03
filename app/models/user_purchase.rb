class UserPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do 
    validates :user_id
    validates :item_id
    validates :prefecture_id
    validates :post, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Post is invalid. Include hyphen(-)" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/, message: "Phone number is invalid. Uninclude hyphen(-)" }
    validates :token
  end
    validates :prefecture_id, numericality: { other_than: 1 }
  def save
    @purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post: post, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: @purchase.id )
  end

end