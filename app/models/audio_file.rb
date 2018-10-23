class AudioFile < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_one_attached :attached_file

  def url
    return nil unless attached_file.attached?
    return file_storage_host_url if ENV.fetch('FILE_STORAGE_HOST').present?

    url_for(attached_file)
  end

  private

  def file_storage_host_url
    "#{ENV.fetch('FILE_STORAGE_HOST')}/#{attached_file.key}"
  end
end
