class Admin::CustomersController < ApplicationController
  # before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
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
