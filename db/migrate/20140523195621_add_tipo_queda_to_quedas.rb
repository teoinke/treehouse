class AddTipoQuedaToQuedas < ActiveRecord::Migration
  def change
    add_column :quedas, :tipo_queda, :string
  end
end
