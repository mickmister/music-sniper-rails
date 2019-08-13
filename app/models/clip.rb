class Clip < ApplicationRecord
  has_many :project_clips, inverse_of: :clip, dependent: :destroy
  has_many :projects, through: :project_clips, inverse_of: :clips
  belongs_to :audio_file, inverse_of: :clips
end
