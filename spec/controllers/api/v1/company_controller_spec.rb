require 'rails_helper'

RSpec.describe Api::V1::CompanyController, type: :controller do
  describe 'when exists one company' do
    let!(:company) { create(:company, name: 'Testing company') }

    context 'search with accent' do
      it 'should return one result' do
        get :search, params: { term: 'tés' }

        expect(response.status).to eq(200)

        expected_results = [{ "text" => company.name, "id" => company.id }]
        results = JSON.parse(response.body)['results']
        expect(results).to eq(expected_results)
      end
    end

    context 'search with uppercase' do
      it 'should return one result' do
        get :search, params: { term: 'TeS' }

        expect(response.status).to eq(200)

        expected_results = [{ "text" => company.name, "id" => company.id }]
        results = JSON.parse(response.body)['results']
        expect(results).to eq(expected_results)
      end
    end

    context "search company that doesn't exists" do
      it 'should return one result' do
        get :search, params: { term: '123' }

        expect(response.status).to eq(200)

        expected_results = []
        results = JSON.parse(response.body)['results']
        expect(results).to eq(expected_results)
      end
    end
  end

  describe 'when does not exists companies' do
    it 'should return empty results' do
      get :search, params: { term: 'Tes' }

      expect(response.status).to eq(200)

      expected_results = []
      results = JSON.parse(response.body)['results']
      expect(results).to eq(expected_results)
    end
  end
end
