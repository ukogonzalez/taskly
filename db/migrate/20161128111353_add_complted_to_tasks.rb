class AddCompltedToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :completed, :boolean, default: false
  end
end
