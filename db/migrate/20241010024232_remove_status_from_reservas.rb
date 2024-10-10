class RemoveStatusFromReservas < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservas, :status, :integer
  end
end
