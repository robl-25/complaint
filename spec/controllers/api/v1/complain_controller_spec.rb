require 'rails_helper'

RSpec.describe Api::V1::ComplainController, type: :controller do
  describe '#new' do
    context 'try create new company with valid params' do
      let(:complain_params) do
        {
          title: 'Test',
          description: 'This is a test',
          company: 'Test company',
          lat: '-364',
          lng: '3685',
          street: 'rua zarur',
          neighbourhood: 'jardim paulista',
          city: 'São Paulo',
          state: 'SP',
          country: 'Brasil'
        }
      end

      it 'should create new complain' do
        post :new, params: { data: complain_params }

        expect(response.status).to eq(200)
        expect(response.body).to eq('{}')
        expect(Complain.count).to eq(1)
      end
    end
  end
end
