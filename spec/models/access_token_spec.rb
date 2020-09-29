require 'rails_helper'

RSpec.describe AccessToken, type: :model do
  describe '#validations' do
    it 'should have valid factory' do
    
    end

    it 'should have validate token' do
    
    end
  end

  describe '#new' do
    let(:user_data) do
      {
        login: 'nafifurqon1',
        url: 'http://example.com',
        avatar_url: 'http://example.com/avatar',
        name: 'Nafi Furqon',
        provider: 'github'
      }
    end
    
    it 'should have a token present after initialize' do
      expect(AccessToken.new.token).to be_present
    end

    it 'should generate uniq token' do
      user = create :user, user_data
      expect{ user.create_access_token }.to change{ AccessToken.count }.by(1)
      expect(user.build_access_token).to be_valid
    end
  end
end
