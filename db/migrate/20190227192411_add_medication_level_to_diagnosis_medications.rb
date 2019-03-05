class AddMedicationLevelToDiagnosisMedications < ActiveRecord::Migration[5.2]
  def change
    add_column :diagnosis_medications, :medication_level, :integer
  end
end
