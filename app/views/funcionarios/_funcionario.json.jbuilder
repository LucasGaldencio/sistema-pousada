json.extract! funcionario, :id, :nome, :cpf, :data_nascimento, :telefone, :email, :cargo, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
