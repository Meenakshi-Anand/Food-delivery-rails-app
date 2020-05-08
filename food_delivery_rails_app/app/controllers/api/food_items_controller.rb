class Api::FoodItemsController < ApplicationController
  before_action :authenticate
  def create
    @item = FoodItem.new(name: params[:name],price: params[:price],description: params[:description])
    if @item.save!
      render json: "New Food Item"
    else
      render json: @item.errors.full_messages, status: 422
    end
  end

end
