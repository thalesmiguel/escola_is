json.extract! curso, :id, :nome, :descricao, :curso_status, :created_at, :updated_at
json.url curso_url(curso, format: :json)
