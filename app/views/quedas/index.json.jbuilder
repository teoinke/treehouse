json.array!(@quedas) do |queda|
  json.extract! queda, :id, :imei, :classificacao, :timestamp_queda, :timestamp_recebimento, :amostra
  json.url queda_url(queda, format: :json)
end
