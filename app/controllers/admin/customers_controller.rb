class Admin::CustomersController < ApplicationController
  #before_action :authenticate_user!

  def index
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
