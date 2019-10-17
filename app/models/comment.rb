class Comment < ApplicationRecord
  belongs_to :user, inverse_of: :comments
  belongs_to :commentable, polymorphic: true, inverse_of: :comments

  # scope audio_file_comments
  # scope :timestamp_comments, -> {where(:body).like(regex or something)}

  def audio_file
    return nil unless commentable_type == 'AudioFile'
    AudioFile.find_by(id: commentable_id)
  end
end
