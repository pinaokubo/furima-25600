class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :product_id, :user_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :product_id
    validates :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'is invalid' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A0[0-9]{1,10}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    purchase = Purchase.create(product_id: product_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building,
                   phone_number: phone_number, purchase_id: purchase.id)
  end
end