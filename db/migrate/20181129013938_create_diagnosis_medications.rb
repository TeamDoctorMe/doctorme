class CreateDiagnosisMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :diagnosis_medications do |t|
      t.references :diagnosis,  foreign_key: true
      t.references :medication, foreign_key: true

      t.timestamps
    end
  end
end
