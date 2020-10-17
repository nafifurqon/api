require 'rails_helper'

describe UserAuthenticator::Standard do
    describe '#perform' do
        let(:authenticator){ described_class.new('nafifurqon', 'ValidPassword') }
        subject{ authenticator.perform }
       
        shared_examples_for 'invalid authentication' do
            before{ user }
            
            it 'should raise an error' do
                expect{ subject }.to raise_error(
                    UserAuthenticator::Standard::AuthenticationError
                )
 
                expect(authenticator.user).to be_nil
            end
        end

        context 'when invalid login' do
            let(:user){ create :user, login: 'otheruser', password: 'ValidPassword' }
            it_behaves_like 'invalid authentication'
        end 

        context 'when invalid password' do
            let(:user){ create :user, login: 'nafifurqon', password: 'InvalidPassword' }
            it_behaves_like 'invalid authentication'
        end

        context 'when successed auth' do
            let(:user){ create :user, login: 'nafifurqon', password: 'ValidPassword' }
            
            before{ user }

            it 'should set the user found in database' do
                expect{ subject }.not_to change{ User.count }
                expect(authenticator.user).to eq(user)
            end

            it 'should create and set user access token' do
                expect{ subject }.to change{ AccessToken.count }.by(1)
                expect(authenticator.access_token).to be_present
            end
        end
    end
end