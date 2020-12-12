class Api::V1::OpinionsController < ApplicationController

    def index
        opinions = Opinion.all
        render json: opinions
    end

    def show
        opinion = Opinion.find(params[:id])
        render json: opinion
    end

    def create
        opinion = Opinion.create!(user_params)
        
        # byebug
        if opinion.valid?
            render json: opinion
        else
            render json: {error: "invalid params"}
        end
    end

    private

    def user_params
        params.require(:opinion).permit(:user_id, :title, :content)
    end

end
