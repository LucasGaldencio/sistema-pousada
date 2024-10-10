class Funcionario < ApplicationRecord
  enum cargo: { gerente: 0, recepcionista: 1, auxiliar: 2 }

  validates :nome, presence: true, length: { minimum: 3 }
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }
  validates :cargo, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_one :conta_usuario, dependent: :destroy
end
