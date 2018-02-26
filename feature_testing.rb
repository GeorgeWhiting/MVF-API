require_relative 'lib/api_controller'
require_relative 'lib/account_holder'

api = Api_controller.new
api.verify_user('8a28f09a-c234-4a95-b1e0-cdbc68979d0a')

# p api.verify_user('wrong')

p api.account

#
# p api.account.display_balance
# p api.account.show_account_details
