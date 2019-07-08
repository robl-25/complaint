require 'rails_helper'

RSpec.describe Api::V1::LocaleController, type: :controller do
  describe 'when exists one city' do
    let!(:locale) { create(:locale, city: 'Testing city') }

    context 'search with accent' do
      it 'should return one result' do
        get :search, params: { term: 'tés' }

        expect(response.status).to eq(200)

        expected_results = [
          { "text" => "#{locale.city} - #{locale.state}", "id" => locale.id }
        ]
        results = JSON.parse(response.body)['results']
        expect(results).to eq(expected_results)
      end
    end
  end
end
