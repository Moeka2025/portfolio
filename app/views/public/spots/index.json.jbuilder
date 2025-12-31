json.data do
  json.items do
    json.array!(@spots) do |spot|
      json.id spot.id
      json.user do
        json.name spot.user.name
        json.image url_for(spot.user.avatar)
      end
      json.image url_for(spot.image)
      json.title spot.title
      json.body spot.body
      json.address spot.address
      json.latitude spot.latitude
      json.longitude spot.longitude
    end  
  end
end