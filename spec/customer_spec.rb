describe Customer do

  test_data = [{
    "id" => "testguid1",
    "firstname" => "first1",
    "lastname" => "last1",
    "email" => "test1@test.com",
    "telephone" => "0123456789",
    "balance" => "100.00"}, {
      "id" => "testguid2",
      "firstname" => "first2",
      "lastname" => "last2",
      "email" => "test2@test.com",
      "telephone" => "0987654321",
      "balance" => "-100.00"}]

  subject {described_class.new(test_data)}

  describe '#accounts' do
    it 'should be initialized with an array of accounts' do
      expect(subject.accounts.length).to eq 2
      expect(subject.accounts[1]['firstname']).to eq 'first2'
    end
  end

  describe '#get_accounts_in_debt' do
    it 'should return an array of guids of accounts in debt' do
      expect(subject.get_accounts_in_debt).to eq ['testguid2']
    end
  end

  describe '#get_account_details' do
    it "should return a list of the account's details" do
      expect(subject.get_account_details('testguid1')).to eq ['first1', 'last1', 'test1@test.com', '0123456789', '100.00']
    end
  end
end
