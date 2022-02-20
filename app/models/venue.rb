require 'open-uri'
class Venue < ApplicationRecord
  before_validation :geocode_physical_address

  def geocode_physical_address
    if self.physical_address.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.physical_address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.physical_address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.physical_address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.physical_address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  has_many   :dishes,
             :through => :bookmarks,
             :source => :dish

  has_many   :users,
             :through => :bookmarks,
             :source => :user

  # Validations

  # Scopes

  def to_s
    dish_id
  end

end
