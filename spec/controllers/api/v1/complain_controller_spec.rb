require 'rails_helper'

RSpec.describe Api::V1::ComplainController, type: :controller do
  describe '#new' do
    context 'try create new company with valid params' do
      let(:complain_params) do
        {
          title: 'Test',
          description: 'This is a test',
          company: 'Test company',
          lat: '-27.2654',
          lng: '89.365',
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

  describe '#search' do
    let!(:complains_1) do
      create_list(
        :complain, 20, city: 'São Paulo', state: 'SP',
        country: 'Brasil', street: 'Rua Aed',
        neighbourhood: 'Vila das rosas',
        company: 'Test 1', location: { lat: '12.596', lng: '-154.32' }
      )
    end

    let!(:complains_2) do
      create_list(
        :complain, 20, city: 'São José dos Campos', state: 'SP',
        country: 'Brasil', street: 'Rua Aed',
        neighbourhood: 'Vila das rosas',
        company: 'Test 1', location: { lat: '18.265', lng: '-123.32' }
      )
    end

    let!(:complains_3) do
      create_list(
        :complain, 20, city: 'São Paulo', state: 'BA',
        country: 'Brasil', street: 'Rua Aed',
        neighbourhood: 'Vila das rosas',
        company: 'Test 1', location: { lat: '56.23', lng: '-154.32' }
      )
    end

    context 'search complains without filters' do
      let(:filters) { { state: 'SP' } }

      it 'return the first page with matches' do
        get :search, params: { data: filters }

        expect(response.status).to eq(200)

        complains = JSON.parse(response.body)['data']

        expect(complains.size).to eq(20)
        expect(complains).to eq(complains_1)
      end
    end
  end
end
