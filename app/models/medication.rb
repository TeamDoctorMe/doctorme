class Medication < ApplicationRecord
  include AgeRange
  include Gender

  validates :title,       presence: true
  validates :description, presence: true
end
