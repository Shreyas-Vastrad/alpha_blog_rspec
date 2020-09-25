require 'rails_helper'

RSpec.describe Api::V1::UsersController  do

    describe 'Methods' do
        describe 'create' do
            it 'should create a new user' do
                # post('/api/v1/users', params: { username: 'Rspec_test',email: 'Rspec_test@gmail.com',password: 'test@123' })
                #expect(User.create(username: 'Rspec_test', email: 'rspec_test@gmail.com', password: "test@123")).to eql(User.last)
                # post :api_v1_signup, :params => { :user => { :usernamename => "Any Name" }, :format => :json }
                # expect(response.content_type).to eq "application/json"
                post :create, params: {:user => {:email => 'shr@gmail.com', :password => 'Shr@96', :username => 'shr_vastrad' }}
                expect(User.last.username).to eql('shr_vastrad')
                #p new_user.params
                #described_class.params [{:session => {:email => 'shreyasvastrad72@gmail.com', :password => 'Shrey@96' }}]
                
            end

        end
    
    end


end
