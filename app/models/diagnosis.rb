class Diagnosis < ApplicationRecord
  include AgeRange
  include Gender

  has_many :symptoms
  has_many :diagnosis_medications
  has_many :medications, through: :diagnosis_medications

  validates :title,       presence: true
  validates :description, presence: true
end
