class Api::V1::OpinionsController < ApplicationController

    skip_before_action :authorized, only: [:index, :show]

    def index
        opinions = Opinion.all
        render json: opinions
    end

    def show
        opinion = Opinion.find(params[:id])
        render json: opinion
    end

    def create
        # byebug
        opinion = Opinion.create!(opinion_params)

        if params[:other_image].class != String
            # byebug
            opinion.other_image.attach(params[:other_image])
        end

        # byebug

        if opinion.valid?
            render json: opinion
        else
            render json: {error: "invalid params"}
        end
    end

    def update
        opinion = Opinion.find(params[:id])

        # byebug

        opinion.update(opinion_params)
        render json: opinion
    end

    def destroy
        opinion = Opinion.find(params[:id])
        # byebug

        opinion.destroy

        render json: {}
    end

    private

    def opinion_params
        params.permit(:user_id, :title, :content)
    end

end
