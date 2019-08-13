class AudioFile < ApplicationRecord
  include Rails.application.routes.url_helpers
  include FileStorage
  has_one_attached :attached_file
  has_many :clips, inverse_of: :audio_file

  after_create :create_full_length_clip

  def url
    calculate_url(attached_file)
  end

  def full_length_clip
    clips.find_by(is_audio_file: true)
  end

  private

  def create_full_length_clip
    Clip.create(
      audio_file_id: self.id,
      is_audio_file: true,
      start: 0,
      end: nil,
    )
  end
end
