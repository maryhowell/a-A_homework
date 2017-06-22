class User < ActiveRecord::Base

  after_initialize :ensure_session_token
  validates :session_token, presence: true, uniqueness: true
  validates(
    :password_digest,
    :email,
    :password_digest,
    :session_token,
    presence: true)
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)

    user && user.is_password?(password) ? user : nil
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

end
