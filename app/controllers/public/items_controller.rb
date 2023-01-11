class Public::ItemsController < ApplicationController
  def index
    @items = Item.paginate(page: params[:page], per_page: 8)
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
