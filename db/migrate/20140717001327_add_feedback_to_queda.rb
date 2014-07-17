class AddFeedbackToQueda < ActiveRecord::Migration
  def change
    add_column :quedas, :feedback, :string
  end
end
