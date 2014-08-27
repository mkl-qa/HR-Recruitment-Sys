class Jobapp < ActiveRecord::Base
  has_many :reverse_relationships, foreign_key: "jobapp_id", class_name: "Relationship", dependent: :destroy
  has_many :users, through: :reverse_relationships, source: :user
end
