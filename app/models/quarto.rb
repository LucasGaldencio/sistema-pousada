class Quarto < ApplicationRecord
  validates :numero, presence: true, uniqueness: true
  validates :tipo, presence: true
  validates :status, presence: true, inclusion: { in: %w[disponível ocupado manutenção] }
end
