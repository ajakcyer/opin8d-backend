class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :opinion_categories, :user_categories
end
