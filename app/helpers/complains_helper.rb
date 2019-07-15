# Helper to filter complains. This helper accept city, state, street,
# neighbourhood, country, company and location filters. For location
# filter you must send max distance (radius parameter). Returns
# a query with applied filters.
#
# Examples:
# # For more thant one filter
# => filter_complains(complains_query, { filter_options })
# # For individualy filter
# => filter_city(complains_query, city)
module ComplainsHelper
  # Use all filters.
  #
  # Parameters:
  #   complains: complain query.
  #   filters: hash. It accept city, state, street,
  #   neighbourhood, country, company and location as keys to be use
  #   as filters. Each value can be a list or single value. Can be empty,
  #   in this case will just return the query.
  #
  # Examples:
  #   # Filter with single city
  #   filter_complains(city: 'São Paulo')
  #   filter_complains(city: ['São Paulo', 'Rio de Janeiro'])
  def filter_complains(filters)
    return Complain if filters.blank?

    complains = filter_city(Complain, filters[:city])
    complains = filter_state(complains, filters[:state])
    complains = filter_country(complains, filters[:country])
    complains = filter_neighbourhood(complains, filters[:neighbourhood])
    complains = filter_street(complains, filters[:street])
    complains = filter_company(complains, filters[:company])
    filter_location(complains, filters[:location])
  end

  # Filter query by city.
  #
  # Parameters:
  #   complains: complain query.
  #   cities: can be an array or a string. Can be empty, in this case
  #   will just return the query.
  #
  # Examples:
  #   # Filter with single city
  #   filter_city(complain_query, 'São Paulo')
  #   filter_city(complain_query, ['São Paulo', 'Rio de Janeiro'])
  def filter_city(complains, cities)
    filter_field(complains, :city, cities)
  end

  # Filter query by state.
  #
  # Parameters:
  #   complains: complain query.
  #   states: can be an array or a string. Can be empty, in this case
  #   will just return the query.
  #
  # Examples:
  #   filter_state(complain_query, 'SP')
  #   filter_state(complain_query, ['SP', 'RJ'])
  def filter_state(complains, states)
    filter_field(complains, :state, states)
  end

  # Filter query by country.
  #
  # Parameters:
  #   complains: complain query.
  #   countries: can be an array or a string. Can be empty, in this case
  #   will just return the query.
  #
  # Examples:
  #   filter_country(complain_query, 'Brasil')
  #   filter_country(complain_query, ['Brasil', 'Argentina'])
  def filter_country(complains, countries)
    filter_field(complains, :country, countries)
  end

  # Filter query by neighbourhood.
  #
  # Parameters:
  #   complains: complain query.
  #   neighbourhoods: can be an array or a string. Can be empty, in this case
  #   will just return the query.
  #
  # Examples:
  #   filter_neighbourhood(complain_query, 'Vila Maria')
  #   filter_neighbourhood(complain_query, ['Vila Maria', 'Blabla'])
  def filter_neighbourhood(complains, neighbourhoods)
    filter_field(complains, :neighbourhood, neighbourhoods)
  end

  # Filter query by street.
  #
  # Parameters:
  #   complains: complain query.
  #   streets: can be an array or a string. Can be empty, in this case
  #   will just return the query.
  #
  # Examples:
  #   filter_street(complain_query, 'Rua central')
  #   filter_street(complain_query, ['Rua central', 'Rua Brasil'])
  def filter_street(complains, streets)
    filter_field(complains, :street, streets)
  end

  # Filter query by company.
  #
  # Parameters:
  #   complains: complain query.
  #   companies: can be an array or a string. Can be empty, in this case
  #   will just return the query.
  #
  # Examples:
  #   filter_company(complain_query, 'Blabla Co')
  #   filter_company(complain_query, ['Blabla Co', 'SuperBig Co'])
  def filter_company(complains, companies)
    filter_field(complains, :company, companies)
  end

  # Filter query by location.
  #
  # Parameters:
  #   complains: complain query.
  #   location: it is a hash. It expect lat, lng and radius as keys.
  #   Can be empty, in this case will just return the query. If you don't
  #   pass one of the keys it will just return the query.
  #
  # Examples:
  #   filter_location(complain_query, { lat: '26.35'. lng: '-89.23', radius: '0.5' } )
  #   fitler_location(complain_query, {})
  def filter_location(complains, location)
    return complains if location.blank? || (location_blank?(location))

    complains = complains
    .near(location: [location[:lng].to_f, location[:lat].to_f])
    .max_distance(location: location[:radius].to_f)
  end

  private

  def location_blank?(location)
    location[:lat].blank? || location[:lng].blank? || location[:radius].blank?
  end

  def filter_field(complains, field, value)
    return complains if value.blank?

    value = [value] unless value.is_a?(Array)
    complains.where(field.to_s => { '$in' => value })
  end
end
