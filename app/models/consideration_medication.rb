class ConsiderationMedication < ApplicationRecord
  belongs_to :consideration
  belongs_to :medication
end
