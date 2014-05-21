class User < ActiveRecord::Base
  has_many :educations, dependent: :destroy
  has_many :professions #, dependent: :destroy
  has_many :Communications, dependent: :destroy
  has_many :availabilities,dependent: :destroy
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	validates :First_Name, presence: true,length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  #				uniqueness:  { case_sensitive: false }
  	
 # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, :presence => {:message => "Enter your email address!" }, :format => { :with => VALID_EMAIL_REGEX, :message => "Enter a valid Email address !"}, :uniqueness => {:case_sensitive => false, :message => "Email already exists!"}

  #validates :email, presence: true, :format=> { :with=> VALID_EMAIL_REGEX , :message=> 'Enter your Email Address' }
  #validates :email, uniqueness:  { case_sensitive: false }, message: 'Please provide a valid Email'
  
    #validates :password, length: { minimum: 6 }
    validates :password, :presence => true, :confirmation => true,
    :length => { minimum: 6 }, :if => lambda{ new_record? || !password.nil? }
  	has_secure_password


    has_attached_file :photo, :styles => { :small => "150x150>" },
                  :url  => "/assets/users/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"

#validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

before_create { generate_token(:auth_token) }

def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end

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
end
