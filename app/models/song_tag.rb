class SongTag < ApplicationRecord
  belongs_to :section
  belongs_to :tag
end
