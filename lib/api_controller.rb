require 'json'

class Api_controller

  attr_reader :account_list

  def initialize
    file = File.read('a4a06bb0-3fbe-40bd-9db2-f68354ba742f.json')
    parsed_json = JSON.parse(file)
    @account_list = parsed_json['accounts']
  end

end
