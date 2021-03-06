class VenueResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :dish_id, :integer
  attribute :physical_address, :string
  attribute :neighborhood_id, :integer

  # Direct associations

  has_many :bookmarks

  # Indirect associations

  many_to_many :dishes

  many_to_many :users
end
