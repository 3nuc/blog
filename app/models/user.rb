class User < ApplicationRecord
  has_many :blogbases, class_name: 'Blogbase', dependent: :destroy
  
  attr_accessor :unhashed_pass
  before_save :encrypt_password
  
  validates_presence_of :unhashed_pass, :on => :create
  validates_presence_of :login
  validates_uniqueness_of :login
  
  def self.authenticate(login, pass)
	user = User.find_by_login(login)
	if user && user.password == BCrypt::Engine.hash_secret(pass, "$2a$10$.DGMQ0eCLiXl90DayDlyF.")
		user
	else
		nil
	end
  end
  
  def encrypt_password
	if unhashed_pass.present?
		self.password = BCrypt::Engine.hash_secret(unhashed_pass, "$2a$10$.DGMQ0eCLiXl90DayDlyF.")
	end
  end
end
