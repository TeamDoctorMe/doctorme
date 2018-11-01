class Consideration < ApplicationRecord
  include AgeRange
  include Gender

  has_many :consideration_medications
  has_many :medications, through: :consideration_medications
  has_many :consideration_patient_cases
  has_many :patient_cases, through: :consideration_patient_cases

  validates :title, presence: true
end
