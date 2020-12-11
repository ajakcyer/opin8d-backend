class OpinionSerializer < ActiveModel::Serializer
  attributes :id, :user, :content, :title, :ratings
end
