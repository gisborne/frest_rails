json.array!(@namespaces) do |namespace|
  json.extract! namespace, :id, :name, :namespace_id
  json.url namespace_url(namespace, format: :json)
end
