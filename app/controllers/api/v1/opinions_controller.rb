class Api::V1::OpinionsController < ApplicationController

    def index
        opinions = Opinion.all
        render json: opinions
    end

    def show
        opinion = Opinion.find(params[:id])
        render json: opinion
    end

end
