class CreatePatientCases < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_cases do |t|
      t.integer    :gender, default: 0
      t.integer    :age
      t.references :symptom,   foreign_key: true
      t.references :diagnosis, foreign_key: true
      t.json       :diagnosis_attributes
      t.json       :medication_attributes

      t.timestamps
    end
  end
end
