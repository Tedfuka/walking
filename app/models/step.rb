class Step < ApplicationRecord
  belongs_to :user, optional: true
end
