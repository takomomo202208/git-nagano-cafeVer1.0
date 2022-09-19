class CartItem < ApplicationRecord
  belongs_to :customers
  belongs_to :items
end
