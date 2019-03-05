class AddPositionToDiagnosisMedications < ActiveRecord::Migration[5.2]
  def change
    add_column :diagnosis_medications, :position, :integer, default: 0
  end
end
