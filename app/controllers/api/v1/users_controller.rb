class Api::V1::UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def show
        my_user = User.find(params[:id])
        render json: my_user
    end

end
