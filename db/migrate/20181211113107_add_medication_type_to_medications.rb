class AddMedicationTypeToMedications < ActiveRecord::Migration[5.2]
  def change
    add_column :medications, :medication_type, :integer, default: 0
  end
end
