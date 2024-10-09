class CreateContaUsuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :conta_usuarios do |t|
      t.integer :usuario_id
      t.string :username
      t.string :senha
      t.string :tipo
      t.string :status

      t.timestamps
    end
  end
end
