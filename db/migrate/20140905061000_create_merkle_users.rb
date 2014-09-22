class CreateMerkleUsers < ActiveRecord::Migration
  def change
    create_table :merkle_users do |t|
      t.string :user_name
      t.string :user_psd
      t.string :eng_name
      t.string :chn_name
      t.string :email
      t.string :bu
      t.string :location
      t.string :mgr
      t.string :position_title
      t.string :user_role

      t.timestamps
    end
  end
end
