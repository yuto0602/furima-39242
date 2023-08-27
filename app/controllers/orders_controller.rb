class OrdersController < ApplicationController
  def create
    @item = Item.new(item_params)
  end
end
