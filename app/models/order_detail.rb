class OrderDetail < ApplicationRecord
  belongs_to :items
  belongs_to :orders
end
