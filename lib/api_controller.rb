require 'json'

class ApiController
  attr_reader :account_list, :account

  def initialize(account_class = AccountHolder)
    @account_class = account_class
    @account = ''

    file = File.read('a4a06bb0-3fbe-40bd-9db2-f68354ba742f.json')
    @account_list = JSON.parse(file)['accounts']
  end

  def verify_user(guid)
    valid_accounts = @account_list.select { |account| account['id'] == guid }
    if valid_accounts.length == 1
      @account = @account_class.new(valid_accounts.first)
    else
      'This guid does not exist'
    end
  end
end
