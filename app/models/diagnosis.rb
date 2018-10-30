class Diagnosis < ApplicationRecord
  include AgeRange
  include Gender

  has_many :symptoms

  validates :title,       presence: true
  validates :description, presence: true
end
