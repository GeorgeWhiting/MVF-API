class Customer
  attr_reader :accounts

  def initialize(accounts)
    @accounts = accounts
  end

  def accounts_in_debt
    in_debt_accounts = []
    @accounts.each do |account|
      in_debt_accounts << account['id'] if account_in_debt?(account)
    end
    in_debt_accounts
  end

  def account_details(guid)
    account = @accounts.select {|s| s['id'].include?(guid)}[0]
    return if account.nil?
    [account['firstname'], account['lastname'], account['email'], account['telephone'], account['balance']]
  end

  private

  def account_in_debt?(account)
    account['balance'].to_f <= 0
  end
end
