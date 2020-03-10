class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email,:presence => true, :uniqueness => { :case_sensitive => false }
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  def authenticate_with_credentials(email, password)
    email = email.strip().downcase()
    user = User.find_by_email(email)
    if user.authenticate(password)
     user
    else 
      nil
    end
  end
  private
end