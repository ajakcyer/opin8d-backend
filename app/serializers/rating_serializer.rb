class RatingSerializer < ActiveModel::Serializer
  attributes :id, :agreeable, :user, :opinion
end
