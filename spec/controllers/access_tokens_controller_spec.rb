require 'rails_helper'

RSpec.describe AccessTokensController, type: :controller do
    describe '#create' do 
        let (:error) do 
            {
                "status" => "401",
                "source" => { "pointer" => "/code" },
                "title"  =>  "Authentication code is invalid",
                "detail" => "You must provide valid code in order to exchange it for token"
            }
        end
        
        context 'when invalid request' do
            it 'should return 401 statu code' do
                post :create
                expect(response).to have_http_status(401)
            end

            it 'should return proper json' do
                post :create
                expect(json['errors']).to include(error)
            end
        end

        context 'when valid request' do
            
        end
    end
end