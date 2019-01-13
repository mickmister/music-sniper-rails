class User < ApplicationRecord
  has_secure_password

  has_many :comments, inverse_of: :user

  def safe_attributes
    as_json.select {|k,v| !['password_digest'].include?(k) }
  end
end
