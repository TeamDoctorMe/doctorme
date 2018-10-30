class CreateSymptoms < ActiveRecord::Migration[5.2]
  def change
    create_table :symptoms do |t|
      t.string     :title
      t.text       :description
      t.integer    :age_min, default: 0
      t.integer    :age_max, default: 120
      t.integer    :gender,  default: 0
      t.integer    :position
      t.integer    :parent_id
      t.references :diagnosis, foreign_key: true

      t.timestamps
    end
  end
end
