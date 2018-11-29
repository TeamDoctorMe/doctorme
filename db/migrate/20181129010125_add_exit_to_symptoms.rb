class AddExitToSymptoms < ActiveRecord::Migration[5.2]
  def change
    add_column :symptoms, :exit, :boolean, default: false
  end
end
