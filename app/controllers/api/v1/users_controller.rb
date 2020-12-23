class Api::V1::UsersController < ApplicationController

    skip_before_action :authorized, only: [:index, :show, :create]

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

        if params[:avatar].class != String
            # byebug
            my_user.avatar.attach(params[:avatar])
        end

        # byebug
        if my_user.valid?
            token = encode_token({user_id: my_user.id})
            render json: {user: UserSerializer.new(my_user), jwt: token}, status: :created
        else
            render json: {error: "Failed to create user"}, status: :not_acceptable
        end
    end

    def profile
        render json: {user: UserSerializer.new(current_user)}, status: :accepted
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :email, :username, :password)
    end

end
