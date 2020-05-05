class Api::UsersController < ApplicationController

  def create
   entity = params[:type] == "Restaurant" ? Restaurant.new : Consumer.new
   entity.save
   user = User.new(name: params[:name], email: params[:email], password_digest: params[:password_digest],
                   contact_no: params[:contact_no], entity_id: entity.id, entity_type: params[:type])
   if user.save!
     address = Address.new(line1: params[:line1],line2: params[:line2],city: params[:city],
                          state: params[:state],country: params[:country],zipcode: params[:zipcode],
                          user_id: user.id)
     if address.save
       render json: "Welcome to Food Delivery"
     else
       render json: address.errors.full_messages, status: 422
     end

   else
     render json: user.errors.full_messages, status: 422
   end
 end


end
