class User < ApplicationRecord
    has_secure_password
    has_many :ratings
    has_many :opinions
    has_many :user_categories

    has_one_attached :avatar, dependent: :destroy
    
end
