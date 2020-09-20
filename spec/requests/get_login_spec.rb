require 'rails_helper'

RSpec.describe 'Login requests' do

  describe 'GET /login' do
    it 'checks status' do
      get('/api/v1/login')
      expect(response.status).to eql(200)
    end
  end
end
