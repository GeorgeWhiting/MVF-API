describe Account_holder do

  test_details = {
    'id' => 'testguid',
    'firstname' => 'first',
    'lastname' => 'last',
    'email' => 'test@test.com',
    'telephone' => '0123456789',
    'balance' => '100.00'
  }
  subject {described_class.new(test_details)}

  describe '#account_details' do
    it 'should be initialized with a hash of details' do
      expect(subject.account_details['id']).to eq 'testguid'
      expect(subject.account_details['firstname']).to eq 'first'
      expect(subject.account_details['lastname']).to eq 'last'
      expect(subject.account_details['email']).to eq 'test@test.com'
      expect(subject.account_details['telephone']).to eq '0123456789'
      expect(subject.account_details['balance']).to eq '100.00'
    end
  end
end
