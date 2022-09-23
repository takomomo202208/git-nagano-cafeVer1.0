class Public::ItemsController < ApplicationController


  def index
    @items = Item.page(params[:page]).per(8)
    #@item = Item.find(params[:id])
  end


  def show
  end

end
