module Api::V1
  class LocaleController < ApplicationController
    def search
      term = ActiveSupport::Inflector.transliterate(params['term']).downcase
      locales = Locale
        .where("unaccent(lower(city)) LIKE ?", "%#{term}%")
        .order(:city)

      locales = locales.map do |locale|
        {
          text: "#{locale.city} - #{locale.state}",
          id: locale.id
        }
      end

      render json: { results: locales }, status: 200
    end
  end
end
