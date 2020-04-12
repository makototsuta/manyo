class ChangeColumnToTask < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :priority, :string, null: false, limit:10
    change_column :tasks, :status, :string, null: false, limit:10
  end
end
