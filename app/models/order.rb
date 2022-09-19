class Order < ApplicationRecord
  belongs_to :customers, dependent: :destroy
  has_many :order_details, dependent: :destroy
end
