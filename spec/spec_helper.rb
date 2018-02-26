require 'api_controller'
require 'account_holder'
require 'customer'
require 'simplecov'
require 'simplecov-console'
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::Console])
SimpleCov.start

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.before(:each) do
    stub_request(:get, /mvf-devtest-s3api.s3-eu-west-1.amazonaws.com/)
      .with(headers: { 'Accept' => '*/*', 'User-Agent' => 'Ruby' })
      .to_return(status: 200, body: '{"source":"test","comments":"Test data generated at http://www.freedatagenerator.com/json-data-generator","accounts":[{"id":"50456415-4ea0-42b2-adae-063edce3225c","firstname":"Henry","lastname":"Chambers","email":"Henry.CHAMBERS7224@reallymymail.com","telephone":"01283 491747","balance":"-1,904.26"}]}', headers: {})
  end
end
