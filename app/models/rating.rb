class Rating < ApplicationRecord
    belongs_to :Opinion
    belongs_to :User
end
