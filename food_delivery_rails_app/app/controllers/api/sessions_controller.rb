class Api::SessionsController < ApplicationController
  skip_before_action :authenticate

    def create
      user = User.find_by(email: params[:email])

      if user.authenticate(params[:password])
        jwt = Auth.issue({user: user.id})
        render json: {jwt: jwt}
      else
      end
    end

end
