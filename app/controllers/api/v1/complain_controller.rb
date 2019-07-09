module Api::V1
  class ComplainController < ApplicationController
    def new
      complain_params = params['data']
      title = complain_params['title']
      description = complain_params['description']
      company_id = complain_params['company_id']
      lat = complain_params['lat']
      long = complain_params['long']
      company = Company.find_by(id: company_id)

      if company.blank?
        render json: { error: 'Company not found' }, status: 404
        return
      end

      Complain.create!(
        title: title,
        description: description,
        company: company,
        lat: lat,
        long: long
      )

      render json: {}, status: 200
    end
  end
end
