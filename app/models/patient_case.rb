class PatientCase < ApplicationRecord
  include Gender
  
  belongs_to :symptom,   required: false
  belongs_to :diagnosis, required: false

  validates :gender, presence: true
  validates :age,    presence: true
end
