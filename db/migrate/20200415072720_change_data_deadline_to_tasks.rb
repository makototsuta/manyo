class ChangeDataDeadlineToTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :deadline, 'date USING CAST(deadline AS date)'
  end
end
