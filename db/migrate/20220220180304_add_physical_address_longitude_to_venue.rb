class AddPhysicalAddressLongitudeToVenue < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :physical_address_longitude, :float
  end
end
