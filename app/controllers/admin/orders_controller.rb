class Admin::OrdersController < ApplicationController
  #before_action :authenticate_admin!
  #管理者以外には処理してほしくないので、最初にadminかどうかを確認

  def index
   # @orders = Order.all
  end

  def show
    # @order = Order.find(params[:id])
  end

  def update #注文ステータスの更新処理
  #@order = Order.find(params[:id])
   # if @order.update(order_params)
    #  redirect_to orders_path(@book.id), notice: "You have updated customer successfully."
    #else
     # render :show#編集ページに戻る
    #end
  end

  private
  def order_params
   # params.require(:〇〇テーブル名).permit(:〇〇, :〇〇カラム名)
  end

end
