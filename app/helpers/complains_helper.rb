module ComplainsHelper
  def filter_complains(filters)
    complains = filter_city(Complain, filters[:city])
    complains = filter_state(complains, filters[:state])
    complains = filter_country(complains, filters[:country])
    complains = filter_neighbourhood(complains, filters[:neighbourhood])
    complains = filter_street(complains, filters[:street])
    filter_location(complains, filters[:location])
  end

  def filter_city(complains, city)
    return complains if city.blank?

    complains.where(city: city)
  end

  def filter_state(complains, state)
    return complains if state.blank?

    complains.where(state: state)
  end

  def filter_country(complains, country)
    return complains if country.blank?

    complains.where(country: country)
  end

  def filter_neighbourhood(complains, neighbourhood)
    return complains if neighbourhood.blank?

    complains.where(neighbourhood: neighbourhood)
  end

  def filter_street(complains, street)
    return complains if street.blank?

    complains.where(street: street)
  end

  def filter_location(complains, location)
    return complains if location.blank? || (location_blank?(location))

    complains = complains
    .near(location: [location[:lat], location[:lng]])

    return complains if location[:radius].blank?

    complains.max_distance(location: location[:radius])
  end

  private

  def location_blank?(location)
    location[:lat].blank? || location[:lng].blank?
  end
end
