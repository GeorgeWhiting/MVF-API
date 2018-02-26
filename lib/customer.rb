class Customer

  attr_reader :accounts

  def initialize(accounts)
    @accounts = accounts
  end

  def account_in_debt?(account)
    account['balance'].to_f <= 0
  end

end
