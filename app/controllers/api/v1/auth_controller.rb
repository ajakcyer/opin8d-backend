class Api::V1::AuthController < ApplicationController

    def create
        @user = User.find_by(username: params[:username])
        # byebug
        if @user && @user.authenticate(params[:password])
            render json: @user
        else
            render json: {error: "invalid password"}
        end
    end

end
