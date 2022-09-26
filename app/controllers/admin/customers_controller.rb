class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :correct_customer, only: [:show, :edit, :update]

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    #@customer = Customer.find(params[:id])
  end

  def edit
    #@customer = Customer.find(params[:id])
  end

  def update
    if @customer.update(customers_params)
      redirect_to admin_customer_path(@customer)#, notice: "You have updated customer successfully."
    else
      render :show #showページに戻る
    end
  end

  private
  def customers_params
   params.require(:customer).permit(:email, :encrypted_password,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:is_deleted)
  end

  def correct_customer
   @customer = Customer.find(params[:id])
  end

end
