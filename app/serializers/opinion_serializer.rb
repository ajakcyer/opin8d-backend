class OpinionSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :content, :title, :ratings, :other_image, :created_at
  belongs_to :user
  # has_many :opinion_categories
  has_many :categories

  def other_image
    if object.other_image.attached?
      # binding.pry
      { url: rails_blob_url(object.other_image) }
    end
  end

end
