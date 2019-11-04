class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  include FileStorage
  has_secure_password validations: false
  has_one_attached :avatar
  acts_as_paranoid

  has_many :comments, inverse_of: :user
  has_many :projects, inverse_of: :user
  has_many :clips, inverse_of: :user
  has_many :audio_files, inverse_of: :user
  has_many :folders, inverse_of: :user
  has_many :oauth_access_datas

  def image_url
    calculate_url(avatar)
  end

  def safe_attributes
    as_json(except: ['password_digest']).merge(image_url: image_url)
  end
end
