class AddPhysicalAddressFormattedAddressToVenue < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :physical_address_formatted_address, :string
  end
end
