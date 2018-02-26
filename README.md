## Customer data API

### The Task

Build an API to implement some of the user stories in below.

We have a public S3 bucket set up at: https://mvf-devtest-s3api.s3-eu-west-1.amazonaws.com/

This contains a number of json files named with the pattern "<guid>.json", e.g.: https://mvf-devtest-s3api.s3-eu-west-1.amazonaws.com/a4a06bb0-3fbe-40bd-9db2-f68354ba742f.json

Each guid (globally unique identifier) represents a customer with access to the API and the data listed within the file represent the accounts they have access to, each of these accounts also being identified by a guid.

Your API should expose the data according to the following rules:

- Users with knowledge of a customer guid (Customers) may search the json file named with the guid and may have access to all it's contents.
- Users with knowledge of an account guid (Account Holders) may have access to any of the data for that account, but not anything else within the same file.

### How to Use

```
- make sure to have ruby installed
- gem install bundler                #=> installs bundler gem
- clone this repo
- bundle                             #=> install gem dependencies
- rspec                              #=> run all unit tests
- ruby feature_testing.rb            #=> run the feature test file
```

For IRB

```
- follow above steps for setup
- irb                                                             #=> open ruby REPL
- require_relative 'lib/api_controller'                           #=> load class files
- ApiController.new                                               #=> Instantiate app controller
- .verify_user(guid)                                              #=> enter a guid and explore the app!
- customers and accounts referenced by calling
 methods on customer or account variables                         #=> eg api.customer.accounts_in_debt
- Customer features: .accounts_in_debt, .account_details(guid)
- Account holder features: .display_balance, .show_account_details
```

### User Stories
```

Data served dynamically from https://mvf-devtest-s3api.s3-eu-west-1.amazonaws.com/

As an account holder
So that I know how much money I have
I want to check my balance

As an account holder
So that I can make sure the correct details are being stored
I want to check the details being held about me

As the customer
So that I can assess them for overdraft interest
I want to get a list of accounts in debt

As the customer
So that I can contact them and talk about their account
I want to get the name, email address, telephone and balance for an account

```
### Process

The most important part to starting this task was to find a way to make JSON files readable. The 'json' gem converts JSON files to easily manipulable ruby hashes, and was an easy choice.

A key part of the task was to make certain data only accessible to certain users. This is what influenced my decision to start development of the app by writing the method verify_user to take a guid as input and create an instance of either a Customer or AccountHolder class based on the guid entered. This way, account holders will only have access to the data stored in their particular instance of AccountHolder class.

The http service gem I chose was 'httparty'. In order to test methods containing GET requests without relying on the bucket being online I chose to use the gem 'webmock'. Webmock works by stopping all requests making it out of the test code, instead supplying a response with customisable body, headers and status. I had to choose between this response being a json or being the raw code from the bucket; I chose json because of the reliance on parsing json at app startup. This meant stubbing the isolate_guids method to return the json file names in order for the parse_bucket test to work.

### Test Coverage

100%
