json.array!(@members) do |member|
  json.extract! member, :id, :status, :ethnicity, :weight, :height, :is_veg, :drink, :dob, :image
  json.url member_url(member, format: :json)
end
