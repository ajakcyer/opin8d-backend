class User < ApplicationRecord
    has_secure_password
    has_many :Ratings
    has_many :Opinions
    
end
