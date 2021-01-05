class User < ApplicationRecord
    has_secure_password
    has_many :ratings
    has_many :opinions
    has_many :user_categories
    has_many :categories, through: :user_categories
    has_many :user_conversations
    has_many :conversations, through: :user_conversations
    has_many :messages

    has_one_attached :avatar, dependent: :destroy
    
end
