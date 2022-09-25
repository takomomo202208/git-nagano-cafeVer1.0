class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  #管理者以外には処理してほしくないので、最初にadminかどうかを確認
  before_action :order_customer, only: [:show]
  #特定のアクション処理の前に参照される

  def index
   #@orders = Order.all
   @orders = Order.page(params[:page])
  end

  def show
   #@customer = Customer.find(params[:id])
   #@cart_items = .find(params[:id])
   
   #商品の合計金額
   @total = @customer.cart_items.all.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def update #注文ステータスの更新処理
  @order = Order.find(params[:id])
  @order_detail = Order_detail.find(params[:id])
    if @order.update(order_params) && @order_detail.update(order_detail_params)
      redirect_to orders_path(@order.id)#, notice: "You have updated customer successfully."
    else
      render :show#詳細ページに戻る
    end
  end

  private
  def order_params
   params.require(:order).permit(:customer_id,:name,:adress,:postal_code,:payment_method,:total_payment,:shipping_cost,:status)
  end
  #params.require(モデル名).permit(キー1, キー2, ...)

  def order_customer
   @order = Order.find(params[:id])#その注文の情報を取得
   @customer = @order.customer#取得したOrderに関連した会員情報を紐づけする→@customerに収納
  end

end
