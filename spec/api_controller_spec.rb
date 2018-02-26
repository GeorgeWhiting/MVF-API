describe ApiController do
  subject { described_class.new(account_class, customer_class) }

  let(:customer) { double(:customer) }
  let(:customer_class) { double(:customer_class, new: customer) }
  let(:account_holder) { double(:account_holder, display_balance: '100.00') }
  let(:account_class) { double(:account_class, new: account_holder) }

  describe '#account_list' do
    it 'should return an array of the accounts in the data file' do
      expect(subject.account_list.length).to eq 100
      expect(subject.account_list).to be_an_instance_of(Array)
    end
  end

  describe 'parse_bucket' do
    it 'should exctract all guids from the AWS bucket and store them in an array' do
      expect(subject.parse_bucket).to eq ["a4a06bb0-3fbe-40bd-9db2-f68354ba742f", "be0438bf-8b0d-4c57-913d-fcafb0bb41f0", "be9b2a8b-e846-4365-8d5f-0fca4ef9aefb"]
    end
  end

  describe '#verify_user' do
    it 'should return a new account object if the entered guid matches an account guid' do
      expect(account_class).to receive(:new)
      subject.verify_user('50456415-4ea0-42b2-adae-063edce3225c')
      expect(subject.account.display_balance).to eq '100.00'
    end
    it 'should return a new customer object if the entered guid matches a customer guid' do
      expect(customer_class).to receive(:new)
      subject.verify_user('a4a06bb0-3fbe-40bd-9db2-f68354ba742f')
    end
    it 'should return a warning if the entered guid does not matche an account guid' do
      expect(subject.verify_user('testguid')).to eq 'This guid does not exist'
    end
  end
end
