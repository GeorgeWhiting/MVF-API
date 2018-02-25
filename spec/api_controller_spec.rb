describe Api_controller do

  subject {described_class.new}

  describe '#account_list' do
    it 'should return an array of the accounts in the data file' do
      expect(subject.account_list.length).to eq 100
      expect(subject.account_list).to be_an_instance_of(Array)
    end
  end

  describe '#verify_user' do
    it 'should return true if the entered guid matches an account guid' do
      expect(subject.verify_user('50456415-4ea0-42b2-adae-063edce3225c')).to eq true
    end
    it 'should return false if the entered guid does not matche an account guid' do
      expect(subject.verify_user('testguid')).to eq false
    end
  end

end
