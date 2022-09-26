class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :obtain_cart_item,only: [:update, :destroy]

  def index

    @cart_items = CartItem.all
    #@cart_items = Cart_Item.page(params[:page]) #ページネーションが必要な場合
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path #数量の変更に成功したとき、カートページに遷移
    else
      puts "処理失敗"
      render :index #処理失敗時はカートのページに遷移
    end
  end

  def create
    @cart_item = current_customer.cart_items.build(cart_item_params) # モデル.build([属性]) → モデルの生成(newの別名)
    #current_customer.cart_items→ログイン中のcustomerに関連付けられた複数の商品(cart_items)を取得し、@cart_itemに渡す

    @cart_items = current_customer.cart_items.all
    #current_customer.cart_items→ログイン中のcustomerに関連付けられたすべての商品(cart_items)を取得し、@cart_itemsに渡す

    @cart_items.each do |cart_item| #カート内の商品と新しくカートに追加する商品で同じものがあるかどうかを探すために、each文で回しす
    #@cart_items はカートに入れているすべての商品。
    #@cart_items に収納されているすべての商品が、個別で(|cart_item|)参照される→一つづつチェックされる

      if cart_item.item_id == @cart_item.item_id
        #cart_item.item.id → 参照した商品(cart_item)に関連した商品ID(item.id)と、
        #@cart_item に関連した商品ID(item.id) が同じかどうかを確認する

        new_amount = cart_item.amount + @cart_item.amount
        #同じ商品があった場合・・・その商品の数量を計算する
        #合計値＝すでにカート内にあった商品の個数＋新しく追加される分の個数

        cart_item.update_attribute(:amount, new_amount)
        #先程出した合計値を対象の商品に更新(update)

        @cart_item.delete
        #追加用に使った商品情報(@cart_item)を削除

      end
    end
    @cart_item.save #カートに、選んだ商品をセーブ
    redirect_to :cart_items #カートページに遷移
  end

  def destroy
    @cart_item.destroy #取得したカート情報を削除
    redirect_to cart_items_path #cart_itemsのindexページへ戻る
  end

  def destroy_all #destroy_all とは、文字通りすべて削除するメソッドで、指定したレコードをすべて削除することができます。
    current_customer.cart_items.destroy_all  #カート情報をすべて削除
    redirect_to cart_items_path #cart_itemsのindexページへ戻る
  end

  private



  def obtain_cart_item
    @cart_item = CartItem.find(params[:id])
    #アクション内にparams[:id]と記述することで、詳細画面で呼び出される投稿データを URLの/posts/:id 内の:idで判別可能にする。
  end

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
