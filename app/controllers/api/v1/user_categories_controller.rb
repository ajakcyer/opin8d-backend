class Api::V1::UserCategoriesController < ApplicationController


    def create
        
    end

    def destroy
        uc = UserCategory.find(params[:id])
        # byebug
        uc.destroy

        render json: {uc_id: uc.id, category_id: uc.category_id}
    end

    private

    def user_cat_params
        params.permit(:user_id, :category_id)
    end
end
