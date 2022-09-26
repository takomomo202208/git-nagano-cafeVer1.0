class Admin::HomesController < ApplicationController

  def top
    redirect_to admin_orders_path
  end


end
