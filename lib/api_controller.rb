require 'json'
require 'httparty'
require_relative 'customer'
require_relative 'account_holder'

class ApiController
  include HTTParty
  attr_reader :account, :customer

  def initialize(account_class = AccountHolder, customer_class = Customer)
    @base_uri = 'https://mvf-devtest-s3api.s3-eu-west-1.amazonaws.com/'
    @account_class = account_class
    @customer_class = customer_class
    @customer_guids = parse_bucket
    extract_account_guids
  end

  def parse_bucket
    @customer_guids = isolate_guids.map { |x| x.delete('.json') }
  end

  def verify_user(guid)
    return if verify_customer(guid)
    return if verify_account_holder(guid)
    'This guid does not exist'
  end

  def extract_account_guids
    @account_list = []
    @customer_guids.each do |customer|
      @account_list += extract_customer_accounts(customer)
    end
  end

  private

  def verify_customer(guid)
    return unless @customer_guids.include?(guid)
    @customer = @customer_class.new(extract_customer_accounts(guid))
  end

  def verify_account_holder(guid)
    valid_accounts = @account_list.select { |account| account['id'] == guid }
    return if valid_accounts.empty?
    @account = @account_class.new(valid_accounts.first)
  end

  def isolate_guids
    HTTParty.get(@base_uri).body.scan(%r{<Key>([^><]*)<\/Key>}).flatten
  end

  def extract_customer_accounts(guid)
    JSON.parse(self.class.get("#{@base_uri}#{guid}.json"))['accounts']
  end
end
