class Opinion < ApplicationRecord
    belongs_to :user
    has_many :ratings
end
