class Api::V1::UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def show
        my_user = User.find(params[:id])
        render json: my_user
    end

    def create
        # byebug
        my_user = User.create!(user_params)
        if my_user.valid?
            render json: my_user, status: :created
        else
            render json: {error: "Failed to create user"}, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
    end

end
