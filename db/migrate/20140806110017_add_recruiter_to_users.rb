class AddRecruiterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :recruiter, :boolean, default: false
  end
end
