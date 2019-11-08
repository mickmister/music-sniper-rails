class Comment < ApplicationRecord
  include BelongsToUser
  belongs_to :user, inverse_of: :comments
  acts_as_paranoid

  belongs_to :commentable, polymorphic: true, inverse_of: :comments

  validates :text, presence: true

  def audio_file
    return nil unless commentable_type == 'AudioFile'
    AudioFile.find_by(id: commentable_id)
  end
end
