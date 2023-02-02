class Public::CartItemsController < ApplicationController
  before_action :confirm_cart_item, only: [:index]
  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.total_price }
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path, notice: "数量が変更されました。"
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path, notice: "カート内の商品が削除されました。"
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_items=current_customer.cart_items.all
      @cart_items.each do |cart_item|
        if cart_item.item_id == @cart_item.item_id
          new_amount = cart_item.amount + @cart_item.amount
          cart_item.update_attribute(:amount, new_amount)
          @cart_item.delete
        end
      end

    @cart_item.save
    redirect_to cart_items_path, notice: "カートに商品が追加されました。"
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

  def confirm_cart_item
    redirect_to items_path unless current_customer.cart_items.exists?
  end
end
