class Clip < ApplicationRecord
  include ProjectAttachable
  include Commentable

  belongs_to :audio_file, inverse_of: :clips
  belongs_to :user, inverse_of: :clips
  validates :audio_file, :user, presence: :true
  validates :name, :start, :end, presence: :true
end
