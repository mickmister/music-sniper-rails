module FileStorage
  include Rails.application.routes.url_helpers

  def calculate_url(storage_obj)
    return nil unless storage_obj.attached?
    return file_storage_host_url(storage_obj) if ENV.fetch('FILE_STORAGE_HOST', nil).present?

    url_for(storage_obj)
  end

  def file_storage_host_url(storage_obj)
    [
      ENV.fetch('FILE_STORAGE_HOST', nil),
      storage_obj.key,
      'blob',
      "#{storage_obj.filename.base}.#{storage_obj.filename.extension}",
    ].join('/')
  end

end
