class CreateJobPositions < ActiveRecord::Migration
  def change
    create_table :job_positions do |t|
      t.string :title
      t.string :dept
      t.integer :opennum
      t.text :description
      t.text :requirement
      t.integer :user_id

      t.timestamps
    end
    add_index :job_positions, [:user_id, :created_at]
  end
end
