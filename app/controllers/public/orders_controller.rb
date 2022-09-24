class Public::OrdersController < ApplicationController
  #sbefore_action :authenticate_customer!

  def new
  end

  def create
  end

  def show
    #@order = Order.find(params[:id])
  end

  def index
    @orders = current_customer.orders.all
    @items = Item.all
    order_id = Order.find_by(params[:order_id])

  end

  def confirm
  end

  def complete
  end

end
