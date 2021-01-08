class Category < ApplicationRecord
    has_many :user_categories
    has_many :opinion_categories
    has_many :opinions, through: :opinion_categories
    has_many :users, through: :user_categories
end
