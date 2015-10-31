json.array!(@public_lists) do |public_list|
  json.extract! public_list, :id, :name, :description
  json.url public_list_url(public_list, format: :json)
end
