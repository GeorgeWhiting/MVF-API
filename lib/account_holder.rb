class AccountHolder
  def initialize(account_details)
    @account_details = account_details
  end

  def display_balance
    "£#{find_account_detail('balance')}"
  end

  def show_account_details
    [find_account_detail('firstname'), find_account_detail('lastname'), find_account_detail('email'), find_account_detail('telephone')]
  end

  private

  def find_account_detail(detail)
    @account_details[detail]
  end
end
