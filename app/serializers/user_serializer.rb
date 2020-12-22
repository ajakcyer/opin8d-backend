class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :first_name, :last_name, :username, :email, :opinions, :ratings, :avatar

  def avatar
    if object.avatar.attached?
      # binding.pry
      { url: rails_blob_url(object.avatar) }
    end
  end
end
