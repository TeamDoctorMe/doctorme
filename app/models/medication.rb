class Medication < ApplicationRecord
  include AgeRange
  include Gender

  has_many :consideration_medications
  has_many :considerations, through: :consideration_medications
  has_many :diagnosis_medications
  has_many :diagnoses, through: :diagnosis_medications

  validates :title,       presence: true
  validates :description, presence: true
end
