class Public::OrdersController < ApplicationController
  #sbefore_action :authenticate_customer!

  def new
  end

  def create
  end

  def show
    @detail = OrderDetail.find(params[:id])
    @order = Order.find(params[:id])
    @customer = @order.customer
    @total = @customer.cart_items.all.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def index
    @orders = current_customer.orders.all
  end

  def confirm
  end

  def complete
  end

end
