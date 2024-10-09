class ContaUsuario < ApplicationRecord
  belongs_to :funcionario

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :senha, presence: true, length: { minimum: 6 }

  # Verificar a senha fornecida
  def authenticate(provided_password)
    self.senha == provided_password
  end
end
