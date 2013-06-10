class MakeMortezaAdmin2 < ActiveRecord::Migration
  def up
    account = Account.find_by_email("mt_q8_2007@yahoo.com")
    account.user.add_role :admin unless account.nil?
    account.user.add_role :super_admin unless account.nil?
  end

  def down
    account = Account.find_by_email("mt_q8_2007@yahoo.com")
    account.user.remove_role :admin unless account.nil?
    account.user.remove_role :super_admin unless account.nil?
  end
end
