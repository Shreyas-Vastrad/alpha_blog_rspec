require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller  do

    describe 'Methods' do
        describe '#create' do
            it 'should create a new user' do
                # post('/api/v1/users', params: { username: 'Rspec_test',email: 'Rspec_test@gmail.com',password: 'test@123' })
                expect(User.create(username: 'Rspec_test', email: 'rspec_test@gmail.com', password: "test@123")).to eql(User.last)
            end

        end
    
    end


end
