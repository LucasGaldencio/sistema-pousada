class Reserva < ApplicationRecord
  # Enum para o status da reserva
  enum status: {
    pendente: 0,
    confirmada: 1,
    cancelada: 2
  }

  belongs_to :hospede
  belongs_to :quarto

  validates :data_entrada, presence: true
  validates :data_saida, presence: true
  validate :saida_depois_da_entrada
  validates :status, presence: true  # Valida que o status deve ser preenchido

  private

  # Validação para garantir que a data de saída é depois da data de entrada
  def saida_depois_da_entrada
    return if data_saida.blank? || data_entrada.blank?
    if data_saida < data_entrada
      errors.add(:data_saida, "deve ser depois da data de entrada")
    end
  end
end
