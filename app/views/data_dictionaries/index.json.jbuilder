json.array!(@data_dictionaries) do |data_dictionary|
  json.extract! data_dictionary, :id, :name, :description, :parent_code, :del_flg
  json.url data_dictionary_url(data_dictionary, format: :json)
end
