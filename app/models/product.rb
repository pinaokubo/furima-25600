class Product < ApplicationRecord
  has_one_attached :image
  # has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :shipping_fee
  belongs_to :scheduled_delivery
  belongs_to :user

   with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is invalid' }
     with_options numericality: { other_than: 0, message: 'is invalid' } do
       validates :category_id
       validates :status_id
       validates :shipping_fee_id
       validates :prefecture_id
       validates :scheduled_delivery_id
     end
   end
end
