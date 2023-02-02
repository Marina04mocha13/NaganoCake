class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @items = Item.search(params[:word])
    render "index"
  end
end
