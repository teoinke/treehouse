class CreateQuedas < ActiveRecord::Migration
  def change
    create_table :quedas do |t|
      t.string :imei
      t.binary :classificacao
      t.timestamp :timestamp_queda
      t.timestamp :timestamp_recebimento
      t.text :amostra

      t.timestamps
    end
  end
end
