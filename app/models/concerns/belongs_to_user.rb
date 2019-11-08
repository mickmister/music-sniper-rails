module BelongsToUser
  extend ActiveSupport::Concern

  included do

    # user_id should not change on update
    validates :user_id,
      inclusion: { in: ->(i) { [i.user_id_was] } },
      on: :update
  end
end
