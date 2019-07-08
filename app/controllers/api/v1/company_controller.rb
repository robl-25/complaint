module Api::V1
  class CompanyController < ApplicationController
    def search
      term = ActiveSupport::Inflector.transliterate(params['term']).downcase
      companies = Company
        .where("unaccent(lower(name)) LIKE ?", "%#{term}%")
        .order(:name)

      companies = companies.map do |company|
        {
          text: company.name,
          id: company.id
        }
      end

      render json: { results: companies }, status: 200
    end
  end
end
