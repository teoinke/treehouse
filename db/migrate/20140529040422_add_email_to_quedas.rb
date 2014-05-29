class AddEmailToQuedas < ActiveRecord::Migration
  def change
    add_column :quedas, :email, :string
  end
end
