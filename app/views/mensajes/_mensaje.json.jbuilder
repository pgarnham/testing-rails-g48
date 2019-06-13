json.extract! mensaje, :id, :autor, :receptor, :contenido, :created_at, :updated_at
json.url mensaje_url(mensaje, format: :json)
