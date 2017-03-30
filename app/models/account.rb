class Account < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true

  def self.authenticate(username, password)
    account = find_by(username: username)
    if account && account.authenticate(password)
      account
    else
      false
    end
  end

  def self.from_token(token)
    payload = Auth.decode(token)
    Account.find(payload["account_id"])
  end
end
