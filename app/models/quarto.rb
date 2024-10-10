class Quarto < ApplicationRecord
  has_many :reservas, dependent: :destroy

  # Definindo o enum para status
  enum status: { disponivel: "disponível", ocupado: "ocupado", manutencao: "manutenção" }

  # Definindo o enum para tipo
  enum tipo: { single: "Single", duplo: "Duplo", suite: "Suite" }

  validates :numero, presence: true, uniqueness: true
  validates :tipo, presence: true
  validates :status, presence: true
end
