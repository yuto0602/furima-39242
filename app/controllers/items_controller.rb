class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_description, :item_category_id, :item_condition_id, :delivery_charge_id, :from_id, :date_of_delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end
