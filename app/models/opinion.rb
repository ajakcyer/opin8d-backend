class Opinion < ApplicationRecord
    belongs_to :User
    has_many :Ratings
end
