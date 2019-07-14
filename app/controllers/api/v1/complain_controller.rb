module Api::V1
  class ComplainController < ApplicationController
    include ComplainsHelper

    def new
      complain_params = params['data']
      title = complain_params['title']
      description = complain_params['description']
      company = complain_params['company']
      lat = complain_params['lat']
      lng = complain_params['lng']
      street = complain_params['street']
      neighbourhood = complain_params['neighbourhood']
      city = complain_params['city']
      state = complain_params['state']
      country = complain_params['country']

      Complain.create!(
        title: title,
        description: description,
        company: company,
        location: { lat: lat, lng: lng },
        street: street,
        neighbourhood: neighbourhood,
        city: city,
        state: state,
        country: country
      )

      render json: {}, status: 200
    end

    def search
      search_params = params['data']
      filters = {
        city: search_params['city'],
        state: search_params['state'],
        country: search_params['country'],
        neighbourhood: search_params['neighbourhood'],
        street: search_params['street'],
        location: {
          lat: search_params['lat'],
          lng: search_params['lng'],
          radius: search_params['radius']
        }
      }
      page = search_params['page'].presence || 1

      complains =
        filter_complains(filters)
        .paginate(page: page)
        .order('created_at DESC')
    end
  end
end
