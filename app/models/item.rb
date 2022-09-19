class Item < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genres
end
