class Public::OrdersController < ApplicationController
  #sbefore_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def create

  end

  def show
  end

  def index
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    pp current_customer.cart_items.all
    # addressにresidenceの値がはいっていれば
    if params[:order][:addresses] == "residence"
      @order.postal_code = current_customer.postal_code
      @order.address     = current_customer.address
      @order.name        = current_customer.last_name + current_customer.first_name
    end

    # カートに入ってる商品の合計金額
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }

  end

  def complete
    # addressにresidenceの値がはいっていれば
      @order.postal_code = current_customer.postal_code
      @order.address     = current_customer.residence
      @order.name        = current_customer.last_name + current_customer.first_name

  end

private
def order_params
  params.require(:order).permit(:payment_method,:address)
end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end
end