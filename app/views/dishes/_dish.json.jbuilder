json.extract! dish, :id, :name, :cuisine_id, :notes, :created_at, :updated_at
json.url dish_url(dish, format: :json)
