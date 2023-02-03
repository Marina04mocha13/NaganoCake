class Public::OrdersController < ApplicationController
  before_action :confirm_cart_item, only: [:new, :confirm, :complete]

  def new
    @order = Order.new
  end

  def confirm
    @order_items = current_customer.cart_items.all
    @total = @order_items.inject(0) { |sum, item| sum + item.total_price }

    @order = Order.new(order_params)
    @order.status = "payment_waiting"
    address_option = params[:order][:address_option].to_i
    if address_option == 0
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    elsif address_option == 1
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif address_option == 2
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]

    else
      render action: :new
    end
  end

  def create
    @order = Order.new(order_params)
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id =  @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.total_price
      @order_detail.making_status = 0
      @order_detail.save
    end
    current_customer.cart_items.destroy_all

    @order.save
    redirect_to complete_orders_path
  end

  def complete
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

  def confirm_cart_item
    redirect_to items_path unless current_customer.cart_items.exists?
  end
end
