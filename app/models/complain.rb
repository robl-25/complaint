class Complain
  include Mongoid::Document
  include Mongoid::Geospatial

  field :title, type: String
  field :description, type: String
  field :company, type: String
  field :location, type: Point
  field :street, type: String
  field :neighbourhood, type: String
  field :city, type: String
  field :state, type: String
  field :country, type: String
  field :created_at, type: Time

  field :location, type: Point, spatial: true
end
