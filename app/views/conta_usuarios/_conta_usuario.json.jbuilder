json.extract! conta_usuario, :id, :usuario_id, :username, :senha, :tipo, :status, :created_at, :updated_at
json.url conta_usuario_url(conta_usuario, format: :json)
