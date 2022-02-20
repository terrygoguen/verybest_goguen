class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :email, :string
  attribute :password, :string
  attribute :image, :string

  # Direct associations

  # Indirect associations

end
