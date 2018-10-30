class ConsiderationPatientCase < ApplicationRecord
  belongs_to :consideration
  belongs_to :patient_case
end
