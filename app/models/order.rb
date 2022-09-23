class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  #enum導入後　enum を定義し、数値と文字列を紐付けし
  enum payment_method: { credit_card: 0, transfer: 1 }
  #enum status: { "入金待ち": 0, "入金確認": 1 , "製作中":2 , "発送準備中":3 , "発送済み":4 }

  def full_address #住所をくっつけるメソッド
    self.postal_code + " " + self.address + " " + self.name
  end

end
