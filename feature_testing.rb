require_relative 'lib/api_controller'
require_relative 'lib/account_holder'
require_relative 'lib/customer'

api = ApiController.new

api.verify_user('a4a06bb0-3fbe-40bd-9db2-f68354ba742f')
p api.customer.accounts_in_debt.length
p api.customer.account_details('9c4ce9dc-92ed-49d0-ad3f-ce634d74483e')
p '---------------------------------'
api.verify_user('8a28f09a-c234-4a95-b1e0-cdbc68979d0a')
p api.account.display_balance
p api.account.show_account_details
p '---------------------------------'
p api.verify_user('wrong')
