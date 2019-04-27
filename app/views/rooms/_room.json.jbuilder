json.extract! room, :id, :name, :location, :disponibility, :noise, :plugs, :created_at, :updated_at
json.url room_url(room, format: :json)
