module Api::V1
  class ComplainController < ApplicationController
    def new
      complain_params = params['data']
      title = complain_params['title']
      description = complain_params['description']
      company_id = complain_params['company_id']
      locale_id = complain_params['locale_id']
      company = Company.find_by(id: company_id)
      locale = Locale.find_by(id: locale_id)

      if company.blank?
        render json: { error: 'Company not found' }, status: 404
        return
      end

      if locale.blank?
        render json: { error: 'Locale not found' }, status: 404
        return
      end

      Complain.create!(
        title: title,
        description: description,
        company: company,
        locale: locale
      )

      render json: {}, status: 200
    end
  end
end
