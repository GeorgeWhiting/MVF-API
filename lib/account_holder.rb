class Account_holder

  attr_reader :account_details

  def initialize(account_details)
    @account_details = account_details
  end

  def get_balance
    @account_details['balance']
  end

  def get_firstname
    @account_details['firstname']
  end

end
