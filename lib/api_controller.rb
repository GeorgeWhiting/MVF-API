require 'json'
require 'httparty'

class ApiController
  include HTTParty
  attr_reader :account, :customer, :account_list

  def initialize(account_class = AccountHolder, customer_class = Customer)
    @base_uri = 'https://mvf-devtest-s3api.s3-eu-west-1.amazonaws.com/'
    @account_class = account_class
    @customer_class = customer_class
    @account = ''
    @customer = ''
    @customer_guids = parse_bucket
    @account_list = []
    extract_account_guids
  end

  def parse_bucket
    @customer_guids = isolate_guids.map { |x| x.delete(".json") }
  end

  def verify_user(guid)
    if @customer_guids.include?(guid)
      @customer = @customer_class.new(@account_list)
      return
    end
    valid_accounts = @account_list.select { |account| account['id'] == guid }
    if !valid_accounts.empty?
      @account = @account_class.new(valid_accounts.first)
    else
      'This guid does not exist'
    end
  end

  def extract_account_guids
    @customer_guids.each do |customer|
      @account_list += JSON.parse(self.class.get("#{@base_uri}#{customer}.json"))['accounts']
    end
  end

  private

  def isolate_guids
    HTTParty.get(@base_uri).body.scan(/<Key>([^><]*)<\/Key>/).flatten
  end

end
