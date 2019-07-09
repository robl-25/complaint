require 'rails_helper'

RSpec.describe Api::V1::ComplainController, type: :controller do
  describe '#new' do
    let!(:locale) { create(:locale) }
    let!(:company) { create(:company) }

    context 'try create new company with invalid company' do
      let(:complain_params) do
        {
          title: 'Test',
          description: 'This is a test',
          company_id: company.id + 1,
          lat: '-364',
          long: '3685'
        }
      end

      it 'should return not found' do
        post :new, params: { data: complain_params }

        expect(response.status).to eq(404)
        message = JSON.parse(response.body)['error']
        expect(message).to eq('Company not found')
      end
    end

    context 'try create new company with valid params' do
      let(:complain_params) do
        {
          title: 'Test',
          description: 'This is a test',
          company_id: company.id,
          lat: '-364',
          long: '3685'
        }
      end

      it 'should return not found' do
        post :new, params: { data: complain_params }

        expect(response.status).to eq(200)
        expect(response.body).to eq('{}')
      end
    end
  end
end
