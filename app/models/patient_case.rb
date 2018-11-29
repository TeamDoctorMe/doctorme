class PatientCase < ApplicationRecord
  include Gender
  
  belongs_to :symptom,   required: false
  belongs_to :diagnosis, required: false

  has_many :consideration_patient_cases
  has_many :considerations, through: :consideration_patient_cases

  validates :gender, presence: true
  validates :age,    presence: true

  before_save :_ensure_diagnosis
  before_save :_ensure_medications

  def potential_symptoms
    Symptom.within_age_range(age).within_gender(gender)
  end

  def potential_medications
    if symptom.present? and symptom.diagnosis.present?
      meds = symptom.diagnosis.medications.within_age_range(age).within_gender(gender)
    else
      meds = Medication.within_age_range(age).within_gender(gender)
    end
      
    if considerations.present?
      medication_considerations = ConsiderationMedication.where(consideration_id: considerations.ids).pluck(:medication_id)
      matching_considerations   = medication_considerations.group_by { |x|x }.to_a.select {|f| f.last.count == considerations.ids.count }
      matching_medication_ids   = matching_considerations.map {|f| f.first} 
      meds                      = meds.where(id: matching_medication_ids)
    end

    meds
  end

  def potential_diagnosis
    if symptom
      Diagnosis.where(id: symptom_id)
    else
      Diagnosis.within_age_range(age).within_gender(gender)
    end
  end

  def potential_considerations
    Consideration.within_age_range(age).within_gender(gender)
  end

  def is_assistable?
    exitable_symptom        = symptom.exit if symptom.present?
    exitable_considerations = considerations.where(exit: true).present?

    unless exitable_symptom == true || exitable_considerations == true
      true
    else
      false
    end
  end

  private

  def _ensure_diagnosis
    if self.symptom.present? and self.diagnosis.nil?
      self.diagnosis            = self.symptom.diagnosis
      self.diagnosis_attributes = self.symptom.diagnosis.to_json
    end
  end

  def _ensure_medications
    self.medication_attributes = potential_medications.to_json
  end
end
