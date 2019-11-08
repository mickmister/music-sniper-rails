class AudioFile < ApplicationRecord
  include FileStorage
  include ProjectAttachable
  include Commentable

  has_one_attached :attached_file
  has_many :clips, inverse_of: :audio_file
  belongs_to :user, inverse_of: :audio_files

  def url
    calculate_url(attached_file)
  end

end
