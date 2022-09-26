class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  #enum導入後 enum を定義し、数値と文字列を紐付けし
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { "Waiting for payment": 0, "payment confirmation": 1 , "In production":2 , "Preparing to ship":3 , "Shipped":4 }

  def full_address #住所をくっつけるメソッド
    self.postal_code + " " + self.address + " " + self.name
  end

end
