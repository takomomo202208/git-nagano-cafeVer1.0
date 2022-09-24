class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  #管理者以外には処理してほしくないので、最初にadminかどうかを確認

  #before_action :order_customer, only: [:show]
  #↑今回は使わなくてもOK

  def index
   #@orders = Order.all
   @orders = Order.page(params[:page])
  end

  def show
   #@order = Order.find(params[:id])
   @customer = order_customer
  end

  def update #注文ステータスの更新処理
  #@order = Order.find(params[:id])
  #@order_detail = Order_detail.find(params[:id])
    #if @order.update(order_params) && @order_detail.update(order_detail_params)
     # redirect_to orders_path(@order.id)#, notice: "You have updated customer successfully."
    #else
     # render :show#詳細ページに戻る
    #end
  end

  private
  def order_params
   params.require(:order).permit(:customer_id,:name,:adress,:postal_code,:payment_method,:total_payment,:shipping_cost,:status)
  end

  def item_params
    params.require(:items).permit(:is_active)
  end

  def order_customer
   @order = Order.find(params[:id])#その注文の情報を取得
   @customer = @order.customer
  end

end
