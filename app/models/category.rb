class Category < ApplicationRecord
    has_many :opinion_categories
    has_many :user_categories
end
