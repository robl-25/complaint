class Complain
  include Mongoid::Document
  include Mongoid::Geospatial

  field :title, type: String
  field :description, type: String
  field :company, type: String
  field :location, type: Point, spatial: true, delegate: true
  field :street, type: String
  field :neighbourhood, type: String
  field :city, type: String
  field :state, type: String
  field :country, type: String
  field :created_at, type: Time

  spatial_index :location, { min: -180, max: 180 }
  index({ city: 1 })
  index({ state: 1 })
  index({ country: 1 })
  index({ neighbourhood: 1 })
  index({ street: 1 })
  index({ company: 1 })
  index({ created_at: -1 })

  spatial_scope :location
end
