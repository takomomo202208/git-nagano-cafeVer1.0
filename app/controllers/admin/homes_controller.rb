class Admin::HomesController < ApplicationController

  def top
    # @order = Order.find(params[:id])
    # @orders = Order.all
    #@orders = Order.page(params[:page])
    redirect_to admin_orders_path
  end

  
end
