class AudioFile < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_one_attached :attached_file

  def url
    url_for(attached_file) if attached_file.attached?
  end
end
