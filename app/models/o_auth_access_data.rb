class OAuthAccessData < ApplicationRecord
  belongs_to :user

  scope :user_id_with_provider, ->(user_id, provider) do
    where(user_id: user_id, provider: provider)
  end
end
