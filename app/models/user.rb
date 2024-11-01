# app/models/user.rb
class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :username, type: String
  field :password, type: String
  field :role, type: String, default: 'user'  
  field :last_login, type: Time
   # Jika Anda menyimpan password secara langsung (tidak disarankan untuk keamanan)
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
 # Memperbarui `last_login` saat berhasil login
    def self.authenticate(username, password)
      user = User.where(username: username).first
      if user && user.password == password
        user.update_attributes(last_login: Time.current)
          Rails.logger.info "Last login updated for user #{user.username} at #{user.last_login}"
        return user
      else
        nil
      end
    end
    def update_last_login
      self.last_login = Time.current
      # Gunakan update_attribute untuk menghindari validasi
      if update_attribute(:last_login, last_login) 
        puts "Last login updated successfully to #{last_login}"
      else
        puts "Failed to update last login: #{errors.full_messages.join(', ')}"
      end
    end
end
