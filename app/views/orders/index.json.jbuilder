json.array!(@orders) do |order|
  json.extract! order, :id, :description, :comment, :client_id, :operator_id
  json.url order_url(order, format: :json)
end
