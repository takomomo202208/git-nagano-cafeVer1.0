class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin! #admin側のユーザーじゃないとこのコントローラの処理は実行されない
  before_action :correct_item, only: [:show, :edit]

  def new
    @item = Item.new #@item=インスタンス変数 Item.new=空のモデル
  end

  def create
    @item = Item.new(item_params) #フォームに記述した文字やデータを受け取る＆受け取ったデータを元にインスタンスを作成する
    if @item.save # インスタンスにsaveメソッドを使いデータベースに保存する
      redirect_to item_path(@item.id) #成功後・・・商品詳細ページに遷移
    else
      render :new #※ render :アクション名で、同じコントローラ内の別アクションのViewを表示できます
    end
  end

  def index
    #@items = Item.all #←これ要らないですよね？
    @items = Item.page(params[:page])
  end

  def show
    #@item = Item.find(params[:id])
  end

  def edit
    #@item = Item.find(params[:id])
  end

  def update #製作ステータスの更新処理
    #@item = Item.find(params[:id])
    #if @item.update(item_params)
     # redirect_to 〇〇_path(@item.id)#, notice: "You have updated customer successfully."
    #else
     # render :〇〇 #〇〇ページに戻る
    #end
  end

  private
  def item_params
    params.require(:items).permit(:name, :introduction,:price,:is_active)
  end

  def correct_item
    @item = Item.find(params[:id])
  end

end
