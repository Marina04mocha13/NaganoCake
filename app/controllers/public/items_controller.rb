class Public::ItemsController < ApplicationController
  def index
    @items = Item.paginate(page: params[:page], per_page: 8)
    @genres = Genre.all
    if params[:genre_id] != nil
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.paginate(page: params[:page], per_page: 8)
      render "index"
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
