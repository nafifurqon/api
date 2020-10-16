require 'rails_helper'

describe UserAuthenticator do
    context 'when initialized with code' do
        let(:authenticator){ described_class.new(code: 'sample') }
        let(:authenticator_class){ UserAuthenticator::Oauth }

        describe '#initialized' do
            it 'should initialized proper authenticator' do
                expect(authenticator_class).to receive(:new).with('sample')
                authenticator
            end
        end
    end

    context 'when initialized with login and password' do
        let(:authenticator){ described_class.new(login: 'nafifurqon', password: 'secret') }
        let(:authenticator_class){ UserAuthenticator::Standard }
        
        describe '#initialized' do
            it 'should initialized proper authenticator' do
                expect(authenticator_class).to receive(:new).with('nafifurqon', 'secret')
                authenticator
            end
        end
    end
end