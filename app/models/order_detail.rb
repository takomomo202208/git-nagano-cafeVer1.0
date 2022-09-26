class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum making_status: { "Cannot be manufactured": 0, "Waiting for production": 1 , "In production":2 , "Completion of production":3 }
  #config/locaales/ja.ymlにて日本語してます

end
