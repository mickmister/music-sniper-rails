class ProjectAttachment < ApplicationRecord
  belongs_to :project, inverse_of: :project_attachments
  belongs_to :item, polymorphic: true, inverse_of: :project_attachments
end
