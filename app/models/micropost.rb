class Micropost < ActiveRecord::Base
  default_scope -> { order('created_at DESC')}
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

end
