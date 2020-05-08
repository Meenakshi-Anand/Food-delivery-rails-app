class Api::CartsController < ApplicationController
  def create
    if current_user.entity_type == "Consumer"
      @cart = Cart.new(consumer_id: current_user.id,restaurant_id: params[:id],order_status:0)
      if @cart.save!
        params[:cart_items].values.each do |item|
          @new_cart_item = CartItem.new(cart_id:@cart.id,food_item_id: item['0'],quantity: item['1'])
        end
        render json:@cart , status: 500
      else
        render json: @cart.errors.full_messages, status: 422
      end
    else
      render json: ["Not authorized to do add items to cart"], status:422
    end
  end
end
