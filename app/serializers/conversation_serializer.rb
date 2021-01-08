class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :messages
  # has_many :messages
  has_many :user_conversations, serializer:UserConversationSerializer
  # has_many :users, serializer:UserConversationSerializer
  # has_many :users, through: :user_conversations
end
