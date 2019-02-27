class RemoveMedicationLevelFromDiagnosisMedications < ActiveRecord::Migration[5.2]
  def change
    remove_column :diagnosis_medications, :medication_level, :integer
  end
end
