class AddLocationToQueda < ActiveRecord::Migration
  def change
    add_column :quedas, :locationX, :string
    add_column :quedas, :locationY, :string
  end
end
