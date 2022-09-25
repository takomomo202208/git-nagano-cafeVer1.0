class Public::OrdersController < ApplicationController
  #sbefore_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def create
    #Order画面で入力された情報をもとにOrdersDBに保存
    @order = current_customer.orders.new(order_submit_params)
    @order.save

    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
    # Cart_itemsの情報をOrderDetailsに移動
      OrderDetail.create(
        item:  cart_item.item,
        order:    @order,
        amount: cart_item.amount,
        price: cart_item.item.taxin_price
    )
    end

    redirect_to complete_orders_path

    # 注文完了後、カート商品を空にする
    # @cart_items.destroy_all
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
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
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

  end

private
def order_params
  params.require(:order).permit(:payment_method,:address)
end

def address_params
  params.require(:order).permit(:postal_code, :address, :name)
end

def order_submit_params
  params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment, :shipping_cost)
end

end
