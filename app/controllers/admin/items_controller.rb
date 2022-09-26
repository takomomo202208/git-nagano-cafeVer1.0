class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin! #admin側のユーザーじゃないとこのコントローラの処理は実行されない
  before_action :correct_item, only: [:show, :edit, :update]

  def new
    @item = Item.new
  end

  def create
    # @item = Item.new(genre_id: params[:item][:genre_id] )ジャンルのプルダウン
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      redirect_to request.referer || admin_path  #元のページに遷移...失敗した場合はTopページへ遷移
    end
  end

  def index
    @items = Item.page(params[:page])
  end

  def show
    #@item = Item.find(params[:id])
  end

  def edit
    # @item = Item.find(params[:id])
  end

  def update #製作ステータスの更新処理
    #@item = Item.find(params[:id]) ← defore_action にかけているため省略可能
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id), notice: "You have updated item successfully."
    else
      render :edit #〇〇ページに戻る
    end
  end

  private

  def item_params
    params.require(:item).permit( :genre_id, :name, :introduction, :price, :is_active)
  end

  def correct_item
    @item = Item.find(params[:id])
  end

end
