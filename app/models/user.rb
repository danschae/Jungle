class User < ActiveRecord::Base

  before_validation :strip_whitespaces, :turn_lowercase

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user && user.authenticate(password) 
      user
    else 
      nil
    end
  end

  def strip_whitespaces
    self.email = self.email.strip
  end

  def turn_lowercase
    self.email = self.email.downcase
  end

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 5}
  validates :password_confirmation, presence: true
end
