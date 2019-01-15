module FileStorage
  include Rails.application.routes.url_helpers

  def calculate_url(storage_obj)
    return nil unless storage_obj.attached?
    return file_storage_host_url(storage_obj) if ENV.fetch('FILE_STORAGE_HOST', nil).present?

    url_for(storage_obj)
  end

  def file_storage_host_url(storage_obj)
    "#{ENV.fetch('FILE_STORAGE_HOST')}/#{storage_obj.key}"
  end

end
