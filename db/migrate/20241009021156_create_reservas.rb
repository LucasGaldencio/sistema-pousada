class CreateReservas < ActiveRecord::Migration[7.0]
  def change
    create_table :reservas do |t|
      t.date :data_entrada
      t.date :data_saida
      t.integer :hospede_id
      t.integer :quarto_id
      t.string :status

      t.timestamps
    end
  end
end
