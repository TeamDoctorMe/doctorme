class CreateMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :medications do |t|
      t.string  :title
      t.text    :description
      t.integer :age_min, default: 0
      t.integer :age_max, default: 120
      t.integer :gender,  default: 0

      t.timestamps
    end
  end
end
