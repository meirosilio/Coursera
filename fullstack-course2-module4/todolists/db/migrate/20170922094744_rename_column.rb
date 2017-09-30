class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :todo_lists, :lise_due_date, :list_due_date
  end
end
