class Relationship < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :jobapp, class_name: "Jobapp"
  validates :user_id, presence: true
  validates :jobapp_id, presence: true
end
