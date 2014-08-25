class CreateJobapps < ActiveRecord::Migration
  def change
    create_table :jobapps do |t|
      t.string :title
      t.string :dept
      t.integer :num
      t.text :description
      t.text :requirement

      t.timestamps
    end
  end
end
