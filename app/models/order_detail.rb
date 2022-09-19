class OrderDetail < ApplicationRecord
  belongs_to :items, dependent: :destroy
  belongs_to :orders, dependent: :destroy
end
