json.extract! venue, :id, :dish_id, :physical_address, :neighborhood_id, :created_at, :updated_at
json.url venue_url(venue, format: :json)
