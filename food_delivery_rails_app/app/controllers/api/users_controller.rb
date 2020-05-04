class Api::UsersController < ApplicationController
  def create

   if params[:type] == "Restaurant"
     @entity = Restaurant.new
     type = "R"
   else
     @entity = Consumer.new
     type = "C"
   end

   @user = User.new(user_params,entity_id: @entity.id,
                entity_type: type)
   if @user.save

     @address = Address.new(address_params,user_id: @user.id)
     if @address.save
       login(@user)
       render "api/users/show"
     else
       render json: @address.errors.full_messages, status: 422
     end

   else
     render json: @user.errors.full_messages, status: 422
   end

 end

 private

 def user_params
   params.require(:user).permit(:name,:email,:password,
                              :contact_no)
 end
 
 def address_params
   params.require(:user).permit(:line1,:line2,:city,:state,
                          :country,:zipcode)
 end

end
