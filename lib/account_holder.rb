class AccountHolder
  def initialize(account_details)
    @account_details = account_details
  end

  def display_balance
    "£#{find_account_balance}"
  end

  def show_account_details
    [find_account_firstname, find_account_lastname, find_account_email, find_account_phone_number]
  end

  private

  def find_account_balance
    @account_details['balance']
  end

  def find_account_firstname
    @account_details['firstname']
  end

  def find_account_lastname
    @account_details['lastname']
  end

  def find_account_email
    @account_details['email']
  end

  def find_account_phone_number
    @account_details['telephone']
  end
end
