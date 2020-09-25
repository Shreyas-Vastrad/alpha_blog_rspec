require 'rails_helper'

RSpec.describe User do
  subject { described_class.new(username: 'Rspec_test', email: 'rspec_test@gmail.com', password: "test@123") }

  describe 'validations' do
    describe 'username' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.username = nil
        expect(subject).to_not be_valid
      end
    end

    describe 'email' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.email = nil
        expect(subject).to_not be_valid
      end
    end

    describe 'emailformat' do
      it 'must be in correct format' do
        expect(subject).to be_valid
        subject.email = 'rspec_test@gm'
        expect(subject).to_not be_valid
        subject.email = 'rspec_tes'
        expect(subject).to_not be_valid
        subject.email = 'rspec_tes.com'
        expect(subject).to_not be_valid
      end
    end

    describe 'email' do
      it 'must have down cased' do
        expect(subject).to be_valid
        subject.email = 'rSpEc_TeSt@gMaiL.cOm' 
        subject.save
        expect(subject.email).to eql('rspec_test@gmail.com')
      end
    end

    describe 'username' do
      it 'must be unique' do
        expect(subject).to be_valid
        subject.save
        expect(described_class.create(username: 'Rspec_test', email: 'rspec@gmail.com', password: "test@123")).to_not be_valid
      end
    end

    describe 'email' do
      it 'must be unique' do
        expect(subject).to be_valid
        subject.save
        expect(described_class.create(username: 'Rspec', email: 'rspec_test@gmail.com', password: "test@123")).to_not be_valid
      end
    end

  end

end
