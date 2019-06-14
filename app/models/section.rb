class Section < ApplicationRecord
  has_many :song_tags, inverse_of: :section
  has_many :tags, through: :song_tags, inverse_of: :sections
end
