class RenameColumnTodoListId < ActiveRecord::Migration
  def change
    rename_column :todo_items, :TodoList_id, :todo_list_id
  end
end
