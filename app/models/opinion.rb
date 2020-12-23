class Opinion < ApplicationRecord
    belongs_to :user
    has_many :ratings

    # attr_accessor :remove_main_image

    # has_rich_text :text_content
    has_one_attached :other_image, dependent: :destroy
end
