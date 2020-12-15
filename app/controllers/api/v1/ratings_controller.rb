class Api::V1::RatingsController < ApplicationController

    def index
        ratings = Rating.all
        render json: ratings
    end

    def show
        rating = Rating.find(params[:id])
        render json: rating
    end

    def create
        rating = Rating.create!(rating_params)
        # byebug

        if rating.valid?
            render json: rating
        else
            render json: {error: "Invalid POST request"}
        end
    end

    def update
        rating = Rating.find(params[:id])

        # byebug

        rating.update(rating_params)
        render json: rating
    end

    def destroy
        rating = Rating.find(params[:id])

        # byebug

        rating.destroy
        render json: {}
    end

    private

    def rating_params
        params.require(:rating).permit(:user_id, :opinion_id, :agreeable)
    end
    
end
