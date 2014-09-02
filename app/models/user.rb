class User < ActiveRecord::Base
  # add relationship to jobapp
  has_many :relationships, foreign_key: "user_id", dependent: :destroy
  has_many :applied_jobapps, through: :relationships, source: :jobapp
  # apply/unapply job
  def applying?(that_job)
    relationships.find_by(jobapp_id: that_job.id)
  end

  def apply!(that_job)
    relationships.create!(jobapp_id: that_job.id)
  end

  def unapply!(that_job)
    relationships.find_by(jobapp_id: that_job.id).destroy
  end
  
  
  before_save {self.email = email.downcase}
  before_create :create_remember_token

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
    private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

  
  validates :name, presence: true, length: { in: 4..20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, length: { in: 6..20 }
  has_secure_password
  
  
  
end