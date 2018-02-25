describe Api_controller do

  subject {described_class.new}

  describe '#account_list' do
    it 'should return an array of the accounts in the data file' do
      expect(subject.account_list.length).to eq 100
      expect(subject.account_list).to be_an_instance_of(Array)
    end
  end

end
