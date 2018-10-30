class CreateConsiderationPatientCases < ActiveRecord::Migration[5.2]
  def change
    create_table :consideration_patient_cases do |t|
      t.references :consideration, foreign_key: true
      t.references :patient_case,  foreign_key: true

      t.timestamps
    end
  end
end
