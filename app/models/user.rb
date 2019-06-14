class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  include FileStorage
  has_secure_password
  has_one_attached :avatar

  has_many :comments, inverse_of: :user

  def image_url
    calculate_url(avatar)
  end

  def as_json(options)
    super(options, except: ['password_digest']).merge(image_url: image_url)
  end
end
