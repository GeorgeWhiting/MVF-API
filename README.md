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
- gem install bundler #=> installs bundler gem
- clone this repo
- bundle #=> install gem dependencies
- rspec #=> run all unit tests
- ruby feature_testing.rb #=> run the feature test file
TBC
```

### User Stories
```
Section 1 - expose static data from a local file

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
