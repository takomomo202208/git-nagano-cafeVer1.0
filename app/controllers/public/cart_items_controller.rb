class Public::CartItemsController < ApplicationController
  #before_action :authenticate_customer!

  def index
  end

  def update
  end

  def create
    #cart_item = CartItem.new(cart_item_params)
    #cart_item.save
    #redirect_to cart_items_path
  end

  def destroy
  end

  def destroy_all
  end

  private

  def cart_item_params
    #params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
