class ProjectClip < ApplicationRecord
  belongs_to :project, inverse_of: :project_clips
  belongs_to :clip, inverse_of: :project_clips

  accepts_nested_attributes_for :clip, :project
end
