class Hospede < ApplicationRecord
  validates :nome, presence: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :cpf, presence: true, uniqueness: true
  validates :telefone, presence: true
end