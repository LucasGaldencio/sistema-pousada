class Quarto < ApplicationRecord
  has_many :reservas, dependent: :destroy

  validates :numero, presence: true, uniqueness: true
  validates :tipo, presence: true
  validates :status, presence: true, inclusion: { in: %w[disponível ocupado manutenção] }
end
