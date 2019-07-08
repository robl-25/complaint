require 'rails_helper'

RSpec.describe Api::V1::LocaleController, type: :controller do
  describe 'when exists one city' do
    let!(:locale) { create(:locale, city: 'Testing city') }

    context 'search with accent' do
      it 'should return one result' do
        get :search, params: { term: 'tés' }

        expect(response.status).to eq(200)

        results = JSON.parse(response.body)
        expect(results.count).to eq(1)
      end
    end
  end
end
