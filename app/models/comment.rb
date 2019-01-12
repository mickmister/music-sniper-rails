class Comment < ApplicationRecord
  belongs_to :user, inverse_of: :comments
  belongs_to :audio_file
end
