class Account_holder

  attr_reader :account_details

  def initialize(account_details)
    @account_details = account_details
  end

  def display_balance
    "£#{get_balance}"
  end

  def show_account_details
    "First Name: #{get_firstname}\nLast Name: #{get_lastname}\nEmail: #{get_email}\nPhone: #{get_phone_number}\n"
  end

  private

  def get_balance
    @account_details['balance']
  end

  def get_firstname
    @account_details['firstname']
  end

  def get_lastname
    @account_details['lastname']
  end

  def get_email
    @account_details['email']
  end

  def get_phone_number
    @account_details['telephone']
  end

end
