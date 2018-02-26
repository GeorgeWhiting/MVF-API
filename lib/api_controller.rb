require 'json'

class ApiController
  attr_reader :account_list, :account, :customer

  def initialize(account_class = AccountHolder, customer_class = Customer)
    @account_class = account_class
    @customer_class = customer_class
    @account = ''
    @customer = ''

    file = File.read('a4a06bb0-3fbe-40bd-9db2-f68354ba742f.json')
    @account_list = JSON.parse(file)['accounts']
  end

  def verify_user(guid)
    if guid == 'a4a06bb0-3fbe-40bd-9db2-f68354ba742f'
      @customer = @customer_class.new(account_list)
    end
    valid_accounts = @account_list.select { |account| account['id'] == guid }
    if valid_accounts.length == 1
      @account = @account_class.new(valid_accounts.first)
    else
      'This guid does not exist'
    end
  end
end
