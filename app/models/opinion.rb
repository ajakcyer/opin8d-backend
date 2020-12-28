class Opinion < ApplicationRecord
    belongs_to :user
    has_many :ratings
    has_many :opinion_categories
    has_many :categories, through: :opinion_categories

    # attr_accessor :remove_main_image

    # has_rich_text :text_content
    has_one_attached :other_image, dependent: :destroy
end
