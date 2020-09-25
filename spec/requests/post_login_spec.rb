require 'rails_helper'

RSpec.describe 'Login requests'do

    describe 'POST /login' do
        it 'checks status' do
            User.create(email: 'shreyasvastrad72@gmail.com', username: 'Shreyas', password: 'Shrey@96')
            #get('/api/v1/login')
            #post ('/api/v1/login', params: {session: {email: "shreyasvastrad723@gmail.com", password: "Shrey@9623"}})
            post '/api/v1/login', params: {:session => {:email => 'shreyasvastrad72@gmail.com', :password => 'Shrey@96' }}
            #post ('/api/v1/login?session[email]=shreyasvastrad72@gmail.com&session[password]=Shrey@96')
            expect(response.status).to eql(200)
        end
    end
end

