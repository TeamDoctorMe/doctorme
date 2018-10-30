class CreateConsiderations < ActiveRecord::Migration[5.2]
  def change
    create_table :considerations do |t|
      t.string  :title
      t.boolean :exit, default: false
      t.integer :age_min
      t.integer :age_max
      t.integer :gender,  default: 0

      t.timestamps
    end
  end
end
