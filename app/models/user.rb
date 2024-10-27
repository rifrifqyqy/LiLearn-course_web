# app/models/user.rb
class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :username, type: String
  field :password, type: String
  field :role, type: String, default: 'user'   # Jika Anda menyimpan password secara langsung (tidak disarankan untuk keamanan)
  attr_accessor :password_confirmation

  # Validasi unik untuk username
  validates :username, presence: true, uniqueness: true
  # validasi password
  validate :password_must_match_confirmation
  # Metode untuk memverifikasi password
  def password_must_match_confirmation
    if password != password_confirmation
      errors.add(:password_confirmation, "Password tidak cocok. Pastikan keduanya sama.")
    end
  end
  # varifikasi username must unique
  def self.authenticate(username, password)
    user = User.where(username: username).first
    return user if user && user.password == password
    nil
  end
end
