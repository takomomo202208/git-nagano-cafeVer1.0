class Admin::HomesController < ApplicationController

  def top
    # @order = Order.find(params[:id])
    # @orders = Order.all
    @orders = Order.page(params[:page])
  end

end
