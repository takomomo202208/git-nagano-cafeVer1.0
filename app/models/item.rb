class Item < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy


  belongs_to :genre, optional: true
  has_one_attached :image

  enum is_active: { "sale": true, "sold out": false }

  #def get_image
    #unless image.attached?
      #file_path = Rails.root.join('app/assets/images/no_image.jpg')
      #image.attache(io:File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    #end
    #image.variant(resize_to_limit: [width, height]).processed
  #end

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
  
  def add_tax_price
    (self.price * 1.08).round
  end

end