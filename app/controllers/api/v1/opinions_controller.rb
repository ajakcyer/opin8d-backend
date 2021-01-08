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
        opinion = Opinion.create!(opinion_params)
        
        if params[:other_image].class != String
            
            opinion.other_image.attach(params[:other_image])
        end

        # byebug

        categories = params[:category_array].split(',')
        # byebug
        if categories.length > 0
            categories.each do |category|
                foundCat = Category.find_by(name: category)
                OpinionCategory.create!(opinion_id: opinion.id, category_id: foundCat.id)
            end
        else
            foundCat = Category.find_by(name: "General")
            OpinionCategory.create!(opinion_id: opinion.id, category_id: foundCat.id)
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
        if params[:delete]
            opinion.other_image.purge
        end
        # byebug
        if params[:other_image]
            opinion.other_image.attach(params[:other_image])
        end
        # byebug

        opinion.update(opinion_params)
        # byebug

        render json: opinion
    end

    def destroy
        opinion = Opinion.find(params[:id])
        # byebug
        opinion.other_image.purge
        opinion.destroy

        render json: {}
    end

    private

    def opinion_params
        params.permit(:user_id, :title, :content)
    end

end
