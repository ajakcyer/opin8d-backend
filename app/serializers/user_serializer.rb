class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :first_name, :last_name, :username, :email, :opinions, :ratings, :avatar, :categories
  has_many :user_categories
  # has_many :user_conversations
  has_many :conversations, serializer:ConversationSerializer
  # has_many :conversations, through: :user_conversations
  # has_many :categories

  def avatar
    # byebug
    if object.avatar.attached?
      # binding.pry
      { url: rails_blob_url(object.avatar) }
    end
  end
end
