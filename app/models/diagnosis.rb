class Diagnosis < ApplicationRecord
  include AgeRange
  include Gender

  has_many :symptoms
  has_many :diagnosis_medications
  has_many :medications, through: :diagnosis_medications

  attr_accessor :primary_medications
  attr_accessor :secondary_medications

  validates :title,       presence: true
  validates :description, presence: true

  def primary_diagnosis_medications
    diagnosis_medications.where(position: 0)
  end

  def primary_medication_ids
    primary_diagnosis_medications.pluck(:medication_id)
  end

  def secondary_diagnosis_medications
    diagnosis_medications.where(position: 1)
  end

  def secondary_medication_ids
    secondary_diagnosis_medications.pluck(:medication_id)
  end

  def primary_medications
    medications.where(position: 0)
  end

  def secondary_medications
    medications.where(position: 1)
  end
end
