class AudioFile < ApplicationRecord
  include Rails.application.routes.url_helpers
  include FileStorage
  has_one_attached :attached_file

  def url
    calculate_url(attached_file)
  end
end
