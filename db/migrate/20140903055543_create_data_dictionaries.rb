class CreateDataDictionaries < ActiveRecord::Migration
  def change
    create_table :data_dictionaries do |t|
      t.string :name
      t.text :description
      t.integer :parent_code
      t.integer :del_flg

      t.timestamps
    end
  end
end
