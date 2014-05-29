class AlterTimestampsQueda < ActiveRecord::Migration
  def self.up 
  	add_column :quedas, :tempo_queda,  :string
  	add_column :quedas, :tempo_recebimento,  :string
  	remove_column :quedas, :classificacao
  	remove_column :quedas, :timestamp_queda
  	remove_column :quedas, :timestamp_recebimento
  rescue
  
    self.down rescue nil
  	remove_column :quedas, :tempo_queda
  	remove_column :quedas, :tempo_recebimento
  	add_column :quedas, :classificacao, :string
  	add_column :quedas, :timestamp_queda, :timestamp
  	add_column :quedas, :timestamp_recebimento, :timestamp
    raise
  end
end
