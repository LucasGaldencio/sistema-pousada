json.extract! reserva, :id, :data_entrada, :data_saida, :hospede_id, :quarto_id, :status, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
