class OpinionCategory < ApplicationRecord
    belongs_to :category
    belongs_to :opinion
end
