class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  def full_address #住所をくっつけるメソッド
    self.postal_code + " " + self.address + " " + self.name
  end

end
