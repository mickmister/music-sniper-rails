class Project < ApplicationRecord
  has_many :project_clips, inverse_of: :project, dependent: :destroy
  has_many :clips, through: :project_clips, inverse_of: :projects
  accepts_nested_attributes_for :project_clips, allow_destroy: true
  belongs_to :user, inverse_of: :projects

  validates :name, :user_id, presence: true
end
