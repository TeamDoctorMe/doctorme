class PatientCase < ApplicationRecord
  include Gender
  
  belongs_to :symptom,   required: false
  belongs_to :diagnosis, required: false

  has_many :consideration_patient_cases
  has_many :considerations, through: :consideration_patient_cases

  validates :gender, presence: true
  validates :age,    presence: true

  before_save :_ensure_diagnosis

  def potential_symptoms
    Symptom.within_age_range(age).within_gender(gender)
  end

  def potential_medications
    Medication.within_age_range(age).within_gender(gender)
  end

  def potential_diagnosis
    Diagnosis.within_age_range(age).within_gender(gender)
  end

  def potential_considerations
    Consideration.within_age_range(age).within_gender(gender)
  end

  private

  def _ensure_diagnosis
    if self.symptom.present? and self.diagnosis.nil?
      self.diagnosis = self.symptom.diagnosis
    end
  end
end
