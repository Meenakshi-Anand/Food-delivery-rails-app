class Api::SessionsController < ApplicationController
  skip_before_action :authenticate

    def create
      @user = User.find_by(email: params[:email])

      if @user && @user.authenticate(params[:password])
         @jwt = Auth.issue({user: @user.id})
        render :show
      else
        render json: ["Invalid Username or Password"], status: 422
      end
    end

    def destroy
      if current_user
        logout
        render json: ["Logged out successfully"], status:500
      else
        render json: ["Your not logged in"], status: 404
      end
    end

end
