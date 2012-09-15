class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :description
      t.string :input_file
      t.integer :user_id

      t.timestamps
    end
    add_index :experiments, [:user_id, :created_at]
  end
end
