require 'json'

class Api_controller

  attr_reader :account_list

  def initialize
    file = File.read('a4a06bb0-3fbe-40bd-9db2-f68354ba742f.json')
    @account_list = JSON.parse(file)['accounts']
  end

  def verify_user(guid)
    valid_accounts = @account_list.select{ |account| account['id'] == guid}
    valid_accounts.length == 1
  end

end
