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

  describe '#display_balance' do
    it "should return the account's balance" do
      expect(subject.display_balance).to eq '£100.00'
    end
  end

  describe '#get_firstname' do
    it "should return the account holder's first name" do
      expect(subject.get_firstname).to eq 'first'
    end
  end

  describe '#get_lastname' do
    it "should return the account holder's last name" do
      expect(subject.get_lastname).to eq 'last'
    end
  end

  describe '#get_email' do
    it "should return the account holder's email address" do
      expect(subject.get_email).to eq 'test@test.com'
    end
  end

  describe '#get_phone_number' do
    it "should return the account holder's phone number" do
      expect(subject.get_phone_number).to eq '0123456789'
    end
  end


end
