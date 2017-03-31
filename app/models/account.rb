class Account < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true

  def self.authenticate(username, password)
    account = Account.find_by(username: username)
    account && account.authenticate(password)
  end
end
