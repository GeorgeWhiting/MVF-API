require_relative 'lib/api_controller'

api = ApiController.new

api.verify_user('a4a06bb0-3fbe-40bd-9db2-f68354ba742f')
p api.customer.accounts_in_debt.length
p api.customer.account_details('9c4ce9dc-92ed-49d0-ad3f-ce634d74483e')
p '---------------------------------'
api.verify_user('be9b2a8b-e846-4365-8d5f-0fca4ef9aefb')
p api.customer.accounts_in_debt.length
p api.customer.account_details('01f521d0-89c8-4c16-ac46-6666b5e5b346')
p '---------------------------------'
api.verify_user('be0438bf-8b0d-4c57-913d-fcafb0bb41f0')
p api.customer.accounts_in_debt.length
p api.customer.account_details('cccfef86-c07b-4722-b6e5-03ccd7918258')
p '---------------------------------'
api.verify_user('8a28f09a-c234-4a95-b1e0-cdbc68979d0a')
p api.account.display_balance
p api.account.show_account_details
p '---------------------------------'
p api.verify_user('wrong')
