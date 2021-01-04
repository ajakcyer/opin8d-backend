class Api::V1::UserCategoriesController < ApplicationController


    def create
        category = Category.find_by(name: params[:category])
        # byebug
        uc = UserCategory.create!(user_id: params[:user_id], category_id: category.id)
        # byebug
        if uc.valid?
            render json: {uc: uc, category: category }
        else
            render json: {error: "invalid params"}
        end
    end

    def destroy
        uc = UserCategory.find(params[:id])
        # byebug
        uc.destroy

        render json: {uc_id: uc.id, category_id: uc.category_id}
    end

    private

    def user_cat_params
        params.permit(:user_id, :category_id, :category)
    end
end
