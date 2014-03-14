class User < ActiveRecord::Base
  before_validation { |user| user.reset_session_token!(false) }

  validates(:password_digest,
            :session_token,
            :email,
            :presence => true
            )

  before_create :set_activation_token

#  validates(:email, :uniqueness => true)


# ActiveRecord::Base::generate_unique_token_for_field defined in lib/active_record_extension.rb
  def self.generate_session_token
    self.generate_unique_token_for_field(:session_token)
  end

  def self.find_by_credentials(email, secret)
    user = User.find_by_email(email)

    user.is_password?(secret) ? user : nil
  end

  def set_activation_token
    self.activation_token = self.class.generate_unique_token_for_field(:activation_token)
  end

  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret).to_s
  end

  def is_password?(secret)
    BCrypt::Password.new(self.password_digest).is_password?(secret)
  end

  def reset_session_token!(force = true)
    return unless self.session_token.nil? || force

    self.session_token = User.generate_session_token
    self.save!
  end

  def activate!
    self.update_attribute(:activated, true)
  end
end

