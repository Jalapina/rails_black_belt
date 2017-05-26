class User < ActiveRecord::Base
  has_secure_password
  has_many :playlists, class_name: :playlist, foreign_key: 'user_id'

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: :true, length:{minimum: 2}
  validates :email, presence: :true, format: {with: EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  before_save :downcase_field

  def downcase_field
    self.email.downcase!
  end

end
