class Rating < ApplicationRecord
    belongs_to :opinion
    belongs_to :user
end
