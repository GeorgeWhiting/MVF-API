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
    @accounts.each do |account|
      unless (details = return_account_details_if_valid(guid, account)).nil? then return details end
    end
  end

  private

  def account_in_debt?(account)
    account['balance'].to_f <= 0
  end

  def return_account_details_if_valid(guid, account)
    return if account['id'] != guid
    [account['firstname'], account['lastname'], account['email'], account['telephone'], account['balance']]
  end
end
