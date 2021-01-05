class UserConversationSerializer < ActiveModel::Serializer
  attributes :id, :user
  # has_one :user
  # belongs_to :conversation

end
