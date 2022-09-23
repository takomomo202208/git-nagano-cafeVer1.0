class Admin::ItemsController < ApplicationController
  #before_action :authenticate_user!

  def new
    @item = Item.new
  end

  def create
    # @item = Item.new(genre_id: params[:item][:genre_id] )ジャンルのプルダウン
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :new
    end
  end

  def index
    @item = Item.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def customers_params
   # params.require(:〇〇テーブル名).permit(:〇〇, :〇〇カラム名)
  end

end
