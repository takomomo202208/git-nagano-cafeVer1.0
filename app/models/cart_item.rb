class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def sum_of_price
    item.taxin_price * amount
  end
  
  def subtotal
    item.add_tax_price * amount
  end
  
  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end
end
