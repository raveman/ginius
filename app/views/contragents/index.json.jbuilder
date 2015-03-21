json.array!(@contragents) do |contragent|
  json.extract! contragent, :id, :name, :service, :contact, :phone, :rating, :comment
  json.url contragent_url(contragent, format: :json)
end
