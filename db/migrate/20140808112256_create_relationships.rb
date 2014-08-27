class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :jobapp_id

      t.timestamps
    end
    add_index :relationships, :user_id
    add_index :relationships, :jobapp_id
    add_index :relationships, [:user_id, :jobapp_id], unique: true

  end
end
