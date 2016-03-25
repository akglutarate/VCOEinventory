class User < ActiveRecord::Base
  
  has_many :items
  has_many :exchanges
  
  before_save { self.email = email.downcase }
  
	
  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }
   
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i          
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 40 },
            format: { with: VALID_EMAIL_REGEX }
  
	validates :location, :presence => { :message => 'Please select a school.' }
	
  has_secure_password
	
	
	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end
	
	def send_password_reset
		generate_token(:password_reset_token)
		self.password_reset_sent_at = Time.zone.now
		save!
		UserMailer.password_reset(self).deliver
	end
	
end