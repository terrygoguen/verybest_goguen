class AddPhysicalAddressLatitudeToVenue < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :physical_address_latitude, :float
  end
end
