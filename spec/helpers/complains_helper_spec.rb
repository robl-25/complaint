require 'rails_helper'

RSpec.describe ComplainsHelper, type: :helper do
  describe '#filter_company' do
    let!(:complains) do
      create_list(:complain, 10, company: 'Company Test')
      create_list(:complain, 10, company: 'Company Test 2')
    end

    context 'send exist company' do
      it 'return all complains with the company' do
        complains = helper.filter_company(Complain, 'Company Test')

        expect(complains.size).to eq(10)
        companies = complains.distinct(:company)
        expect(companies).to eq(['Company Test'])
      end
    end

    context 'send using more than one company' do
      it 'return all complains with all companys' do
        complains = helper.filter_company(
          Complain, ['Company Test', 'Company Test 2']
        )

        expect(complains.size).to eq(20)
        companies = complains.distinct(:company)
        expect(companies).to eq(['Company Test', 'Company Test 2'])
      end
    end

    context 'send not exist company' do
      it 'should return zero complains' do
        complains = helper.filter_company(Complain, 'Rua São Sebastião')

        expect(complains.size).to eq(0)
      end
    end
  end

  describe '#filter_street' do
    let!(:complains) do
      create_list(:complain, 10, street: 'Avenida Brasil')
      create_list(:complain, 10, street: 'Rua São João')
    end

    context 'send exist street' do
      it 'return all complains with the street' do
        complains = helper.filter_street(Complain, 'Avenida Brasil')

        expect(complains.size).to eq(10)
        streets = complains.distinct(:street)
        expect(streets).to eq(['Avenida Brasil'])
      end
    end

    context 'send using more than one street' do
      it 'return all complains with all streets' do
        complains = helper.filter_street(
          Complain, ['Avenida Brasil', 'Rua São João']
        )

        expect(complains.size).to eq(20)
        streets = complains.distinct(:street)
        expect(streets).to eq(['Avenida Brasil', 'Rua São João'])
      end
    end

    context 'send not exist street' do
      it 'should return zero complains' do
        complains = helper.filter_street(Complain, 'Rua São Sebastião')

        expect(complains.size).to eq(0)
      end
    end
  end

  describe '#filter_neighbourhood' do
    let!(:complains) do
      create_list(:complain, 10, neighbourhood: 'Vila Bla')
      create_list(:complain, 10, neighbourhood: 'Vila Bela')
    end

    context 'send exist neighbourhood' do
      it 'return all complains with the neighbourhood' do
        complains = helper.filter_neighbourhood(Complain, 'Vila Bla')

        expect(complains.size).to eq(10)
        neighbourhoods = complains.distinct(:neighbourhood)
        expect(neighbourhoods).to eq(['Vila Bla'])
      end
    end

    context 'send using more than one neighbourhood' do
      it 'return all complains with all neighbourhoods' do
        complains = helper.filter_neighbourhood(
          Complain, ['Vila Bla', 'Vila Bela']
        )

        expect(complains.size).to eq(20)
        neighbourhoods = complains.distinct(:neighbourhood)
        expect(neighbourhoods).to eq(['Vila Bla', 'Vila Bela'])
      end
    end

    context 'send not exist neighbourhood' do
      it 'should return zero complains' do
        complains = helper.filter_neighbourhood(Complain, 'Jardim Duo')

        expect(complains.size).to eq(0)
      end
    end
  end

  describe '#filter_city' do
    let!(:complains) do
      create_list(:complain, 10, city: 'São Paulo')
      create_list(:complain, 10, city: 'Curitiba')
    end

    context 'send exist city' do
      it 'return all complains with the city' do
        complains = helper.filter_city(Complain, 'São Paulo')

        expect(complains.size).to eq(10)
        cities = complains.distinct(:city)
        expect(cities).to eq(['São Paulo'])
      end
    end

    context 'send using more than one city' do
      it 'return all complains with all cities' do
        complains = helper.filter_city(Complain, ['São Paulo', 'Curitiba'])

        expect(complains.size).to eq(20)
        cities = complains.distinct(:city)
        expect(cities).to eq(['São Paulo', 'Curitiba'])
      end
    end

    context 'send not exist city' do
      it 'should return zero complains' do
        complains = helper.filter_city(Complain, 'Rio de Janeiro')

        expect(complains.size).to eq(0)
      end
    end
  end

  describe '#filter_state' do
    let!(:complains) do
      create_list(:complain, 10, state: 'SP')
      create_list(:complain, 10, state: 'RJ')
    end

    context 'send exist state' do
      it 'return all complains with the state' do
        complains = helper.filter_state(Complain, 'SP')

        expect(complains.size).to eq(10)
        states = complains.distinct(:state)
        expect(states).to eq(['SP'])
      end
    end

    context 'send using more than one state' do
      it 'return all complains with all states' do
        complains = helper.filter_state(Complain, ['SP', 'RJ'])

        expect(complains.size).to eq(20)
        states = complains.distinct(:state)
        expect(states).to eq(['SP', 'RJ'])
      end
    end

    context 'send not exist state' do
      it 'should return zero complains' do
        complains = helper.filter_state(Complain, 'RO')

        expect(complains.size).to eq(0)
      end
    end
  end

  describe '#filter_country' do
    let!(:complains) do
      create_list(:complain, 10, country: 'Brasil')
      create_list(:complain, 10, country: 'Estados Unidos')
    end

    context 'send exist country' do
      it 'return all complains with the country' do
        complains = helper.filter_country(Complain, 'Brasil')

        expect(complains.size).to eq(10)
        countries = complains.distinct(:country)
        expect(countries).to eq(['Brasil'])
      end
    end

    context 'send using more than one country' do
      it 'return all complains with all countrys' do
        complains = helper.filter_country(
          Complain,
          ['Brasil', 'Estados Unidos']
        )

        expect(complains.size).to eq(20)
        countries = complains.distinct(:country)
        expect(countries).to eq(['Brasil', 'Estados Unidos'])
      end
    end

    context 'send not exist country' do
      it 'should return zero complains' do
        complains = helper.filter_country(Complain, 'Canadá')

        expect(complains.size).to eq(0)
      end
    end
  end

  describe '#filter_location' do
    let!(:complains) do
      create_list(:complain, 10, location: { lat: '25.234', lng: '-34.56' })
      create_list(:complain, 10, location: { lat: '-90.39', lng: '-129.21' })
    end

    context 'send location with radius that contains only first location' do
      it 'return all complains with radius limit' do
        location = { lat: '21.234', lng: '-34.56', radius: '5' }
        complains = helper.filter_location(Complain, location)

        expect(complains.count).to eq(10)
        locations = complains.distinct(:location)
        expect(locations).to eq([-34.56, 25.234])
      end
    end

    context 'send location with radius that not conatins any complain' do
      it 'should return zero complains' do
        location = { lat: '12.69', lng: '-78.26', radius: '0.5' }
        complains = helper.filter_location(Complain, location)

        expect(complains.size).to eq(0)
      end
    end
  end

  describe '#filter_complains' do
    context 'filter by city and state' do
      let!(:complains) do
        create_list(:complain, 10, city: 'São Paulo', state: 'SP')
        create_list(:complain, 10, city: 'Curitiba', state: 'PR')
        create_list(:complain, 10, city: 'Curitiba', state: 'BA')
      end

      let(:filters) do
        { city: 'Curitiba', state: 'PR' }
      end

      it 'should return only results with sended state and city' do
        complains = helper.filter_complains(filters)

        expect(complains.size).to eq(10)

        cities = complains.distinct(:city)
        expect(cities).to eq(['Curitiba'])

        states = complains.distinct(:state)
        expect(states).to eq(['PR'])
      end
    end

    context 'using all filters' do
      let!(:complains) do
        create_list(
          :complain, 10, city: 'São Paulo', state: 'SP',
          country: 'Brasil', street: 'Rua Aed',
          neighbourhood: 'Vila das rosas',
          company: 'Test 1', location: { lat: '12.596', lng: '-154.32' }
        )
        create_list(
          :complain, 10, city: 'São José dos Campos', state: 'SP',
          country: 'Brasil', street: 'Rua Aed',
          neighbourhood: 'Vila das rosas',
          company: 'Test 1', location: { lat: '18.265', lng: '-123.32' }
        )
        create_list(
          :complain, 10, city: 'São Paulo', state: 'BA',
          country: 'Brasil', street: 'Rua Aed',
          neighbourhood: 'Vila das rosas',
          company: 'Test 1', location: { lat: '56.23', lng: '-154.32' }
        )
      end

      let(:filters) do
        {
          city: 'São Paulo', state: 'SP',
          country: 'Brasil', street: 'Rua Aed',
          neighbourhood: 'Vila das rosas',
          company: 'Test 1', location: { lat: '12.596', lng: '-154.32' }
        }
      end

      it 'should return only results with sended filters' do
        complains = helper.filter_complains(filters)

        expect(complains.size).to eq(10)

        cities = complains.distinct(:city)
        expect(cities).to eq(['São Paulo'])

        states = complains.distinct(:state)
        expect(states).to eq(['SP'])

        streets = complains.distinct(:street)
        expect(streets).to eq(['Rua Aed'])

        neighbourhoods = complains.distinct(:neighbourhood)
        expect(neighbourhoods).to eq(['Vila das rosas'])

        companies = complains.distinct(:company)
        expect(companies).to eq(['Test 1'])

        countries = complains.distinct(:country)
        expect(countries).to eq(['Brasil'])

        locations = complains.distinct(:location)
        expect(locations).to eq([-154.32, 12.596])
      end
    end
  end
end
