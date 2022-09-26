class Public::HomesController < ApplicationController

  def top
    #商品一覧の処理へ遷移(public/items/index)
    #redirect_to items_path
    @items = Item.page(params[:page]).per(4).order(created_at: :desc)
  end

  def about
  end
end
