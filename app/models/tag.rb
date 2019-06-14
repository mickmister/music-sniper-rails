class Tag < ApplicationRecord
  has_many :song_tags, inverse_of: :tag
  has_many :sections, through: :song_tags, inverse_of: :tags
end
