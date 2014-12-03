json.array!(@pictures) do |picture|
  json.extract! picture, :id, :description
  json.url picture_url(picture, format: :json)
end
