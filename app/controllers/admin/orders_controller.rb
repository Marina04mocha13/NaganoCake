class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      @order_details.update_all(making_status: 1) if @order.status == "payment_confirmation"

      redirect_to admin_order_path(params[:id]), notice: "ステータスが更新されました。"
    else
      render :show
    end
  end

  def order_params
    params.require(:order).permit(:status)
  end

end
