class OpinionSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :content, :title, :ratings, :other_images
  belongs_to :user

  def other_images
    if object.other_images.attached?
      # binding.pry
      object.other_images.map { |image| rails_blob_url(image) }
      # { url: rails_blob_url(object.other_images) }
    end
  end

end
