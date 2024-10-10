class AddFuncionarioIdToContaUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :conta_usuarios, :funcionario_id, :integer
    add_index :conta_usuarios, :funcionario_id # Adiciona um índice para facilitar as consultas
  end
end
