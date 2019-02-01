class Step < ApplicationRecord
  validates :step, presence: true
  validates :date, presence: true
  belongs_to :user, optional: true
end
