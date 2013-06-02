class Authentication < ActiveRecord::Base
  attr_accessible :account_id, :provider, :uid, :token, :token_secret

  belongs_to :account
end
