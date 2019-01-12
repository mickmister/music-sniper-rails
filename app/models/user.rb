class User < ApplicationRecord
  has_many :comments, inverse_of: :user

  def cool_comments
    comments.select do |comment|
      comment.text.include? 'cool'
    end
  end
end
