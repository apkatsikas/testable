require "securerandom"

class RandomUtil
  def self.random_email domain="gmail.com"
    SecureRandom.hex[0..9] + "@" + domain
  end
  
  def self.random_password
    SecureRandom.hex[0..9]
  end
end
