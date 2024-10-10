class Reserva < ApplicationRecord
  belongs_to :hospede
  belongs_to :quarto

  validates :data_entrada, presence: true
  validates :data_saida, presence: true
  validate :saida_depois_da_entrada

  private

  def saida_depois_da_entrada
    return if data_saida.blank? || data_entrada.blank?
    if data_saida < data_entrada
      errors.add(:data_saida, "deve ser depois da data de entrada")
    end
  end
end
