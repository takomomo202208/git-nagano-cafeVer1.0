class Public::CustomersController < ApplicationController
  #before_action :authenticate_customer!

  def show
    pp current_customer
    @customer = current_customer
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

end
