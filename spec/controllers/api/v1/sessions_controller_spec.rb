require 'rails_helper'

RSpec.describe Api::V1::SessionsController  do

    describe 'Methods' do
        describe '#create' do
            it 'should login user' do
                # post('/api/v1/users', params: { username: 'Rspec_test',email: 'Rspec_test@gmail.com',password: 'test@123' })
                # current_user = User.create(username: 'Rspec_test', email: 'rspec_test@gmail.com', password: "test@123")
                # post :show, :id => subcategory.id.to_s, :sort => 'title'
                # expect(User.create(username: 'Rspec_test', email: 'rspec_test@gmail.com', password: "test@123")).to eql(User.last)
                current_user = User.create(email: 'shreyasvastrad723@gmail.com', username: 'Shreyas9623', password: 'Shrey@9623')
                post :create, :params => { :session => { :email => "shreyasvastrad723@gmail.com", :password => "Shrey@9623" }, :format => :json }
                expect(session[:user_id]).to eq(current_user.id)
            end

        end

        describe '#destroy' do
            it 'should logout the user' do
                delete :destroy
                expect(session[:user_id]).to eq(nil)
            end
        end
    
    end


end