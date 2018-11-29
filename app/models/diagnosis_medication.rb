class DiagnosisMedication < ApplicationRecord
  belongs_to :diagnosis
  belongs_to :medication
end
