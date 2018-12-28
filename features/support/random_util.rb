require 'securerandom'

module RandomUtil
  def random_email(domain = 'gmail.com')
    SecureRandom.hex[0..9] + '@' + domain
  end

  def random_password
    SecureRandom.hex[0..9]
  end
end
