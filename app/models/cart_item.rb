class CartItem < ApplicationRecord
  belongs_to :customers, dependent: :destroy
  belongs_to :items, dependent: :destroy
end
