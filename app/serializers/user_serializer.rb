class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :first_name, :last_name, :username, :email, :opinions, :ratings, :avatar
  has_many :categories
  has_many :user_categories

  def avatar
    if object.avatar.attached?
      # binding.pry
      { url: rails_blob_url(object.avatar) }
    end
  end
end
