class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :opinions
  has_many :opinion_categories
  has_many :user_categories
end
